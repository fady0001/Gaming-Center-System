import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/color_palette.dart';
import '../../../../core/utils/time_format.dart';
import '../../../devices/domain/entities/unified_device.dart';
import '../../../devices/presentation/cubit/devices_overview_cubit.dart';
import '../../domain/entities/booking.dart';
import '../cubit/bookings_cubit.dart';

/// نموذج حجز جديد: الاسم، الهاتف، الجهاز/الطاولة، التاريخ، البداية، النهاية.
class BookingFormDialog extends StatefulWidget {
  /// اليوم المعروض حاليًا في الصفحة، يُستخدم تاريخًا افتراضيًا.
  final DateTime initialDay;

  const BookingFormDialog({super.key, required this.initialDay});

  static Future<void> show(BuildContext context, {required DateTime day}) {
    return showDialog(
      context: context,
      builder: (_) => MultiBlocProvider(
        providers: [
          BlocProvider.value(value: context.read<BookingsCubit>()),
          BlocProvider.value(value: context.read<DevicesOverviewCubit>()),
        ],
        child: BookingFormDialog(initialDay: day),
      ),
    );
  }

  @override
  State<BookingFormDialog> createState() => _BookingFormDialogState();
}

class _BookingFormDialogState extends State<BookingFormDialog> {
  final _name = TextEditingController();
  final _phone = TextEditingController();
  UnifiedDevice? _device;
  late DateTime _date;
  late TimeOfDay _start;
  late TimeOfDay _end;
  String? _error;
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    final today = DateTime.now();
    _date = DateTime(
        widget.initialDay.year, widget.initialDay.month, widget.initialDay.day);
    final nextHour = (today.hour + 1) % 24;
    _start = TimeOfDay(hour: nextHour, minute: 0);
    _end = TimeOfDay(hour: (nextHour + 1) % 24, minute: 0);
  }

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    super.dispose();
  }

  DateTime _at(TimeOfDay t) =>
      DateTime(_date.year, _date.month, _date.day, t.hour, t.minute);

  String _clock(TimeOfDay t) =>
      formatClock(DateTime(2000, 1, 1, t.hour, t.minute));

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _date.isBefore(DateTime(now.year, now.month, now.day))
          ? now
          : _date,
      firstDate: DateTime(now.year, now.month, now.day),
      lastDate: now.add(const Duration(days: 365)),
    );
    if (picked != null) setState(() => _date = picked);
  }

  Future<void> _pickTime(bool isStart) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: isStart ? _start : _end,
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
        child: child!,
      ),
    );
    if (picked != null) {
      setState(() => isStart ? _start = picked : _end = picked);
    }
  }

  Future<void> _save() async {
    final device = _device;
    if (device == null) {
      setState(() => _error = 'اختر الجهاز أو الطاولة');
      return;
    }
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      await context.read<BookingsCubit>().create(
            customerName: _name.text,
            phone: _phone.text,
            resourceType: device.kind.resourceType,
            resourceId: device.id,
            resourceName: device.name,
            startAt: _at(_start),
            endAt: _at(_end),
          );
      if (mounted) Navigator.of(context).pop();
    } on BookingConflictException catch (e) {
      if (mounted) setState(() => _error = e.message);
    } on BookingValidationException catch (e) {
      if (mounted) setState(() => _error = e.message);
    } catch (e) {
      if (mounted) setState(() => _error = 'تعذّر حفظ الحجز: $e');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    // الأجهزة في الصيانة لا تُحجز. الجهاز الشغّال يمكن حجزه لوقت لاحق.
    final devices = context
        .watch<DevicesOverviewCubit>()
        .state
        .devices
        .where((d) => d.status != DeviceStatus.maintenance)
        .toList();

    return AlertDialog(
      title: const Text('حجز جديد'),
      content: SizedBox(
        width: 440,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _name,
                decoration: const InputDecoration(labelText: 'اسم الزبون'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _phone,
                keyboardType: TextInputType.phone,
                textDirection: TextDirection.ltr,
                decoration: const InputDecoration(labelText: 'رقم الهاتف'),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<UnifiedDevice>(
                initialValue: _device,
                decoration:
                    const InputDecoration(labelText: 'الجهاز / الطاولة'),
                items: [
                  for (final d in devices)
                    DropdownMenuItem(
                      value: d,
                      child: Text('${d.name} — ${d.typeLabel}'),
                    ),
                ],
                onChanged: (v) => setState(() => _device = v),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: _pickDate,
                icon: const Icon(Icons.calendar_today_outlined),
                label: Text('التاريخ: ${formatDate(_date)}'),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => _pickTime(true),
                      icon: const Icon(Icons.schedule),
                      label: Text('من ${_clock(_start)}'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => _pickTime(false),
                      icon: const Icon(Icons.schedule),
                      label: Text('إلى ${_clock(_end)}'),
                    ),
                  ),
                ],
              ),
              if (_error != null) ...[
                const SizedBox(height: 12),
                Text(_error!,
                    style: const TextStyle(color: ColorPalette.danger)),
              ],
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _busy ? null : () => Navigator.of(context).pop(),
          child: const Text('إلغاء'),
        ),
        ElevatedButton(
          onPressed: _busy ? null : _save,
          child: const Text('حفظ الحجز'),
        ),
      ],
    );
  }
}
