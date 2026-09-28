import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/value_objects/money.dart';
import '../../../../core/domain/value_objects/money_parser.dart';
import '../../../../core/theme/color_palette.dart';
import '../../../../core/theme/dimensions.dart';
import '../../../playstation/domain/entities/playstation_device.dart';
import '../../../playstation/presentation/cubit/playstation_cubit.dart';
import 'rate_fields.dart';

/// إضافة/تعديل جهاز بلايستيشن: الاسم + سعر ساعة مستقل لكل عدد لاعبين (1-4).
class PlayStationFormDialog extends StatefulWidget {
  final PlayStationDevice? existing;
  const PlayStationFormDialog({super.key, this.existing});

  static Future<void> show(BuildContext context, {PlayStationDevice? device}) {
    return showDialog(
      context: context,
      builder: (_) => BlocProvider.value(
        value: context.read<PlayStationCubit>(),
        child: PlayStationFormDialog(existing: device),
      ),
    );
  }

  @override
  State<PlayStationFormDialog> createState() => _PlayStationFormDialogState();
}

class _PlayStationFormDialogState extends State<PlayStationFormDialog> {
  late final TextEditingController _name;
  late final List<TextEditingController> _rates;
  late final TextEditingController _minMinutes;
  late final TextEditingController _rounding;
  String? _error;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final d = widget.existing;
    _name = TextEditingController(text: d?.name ?? '');
    _rates = List.generate(
      PlayStationDevice.maxPlayers,
      (i) => TextEditingController(text: d?.hourlyRates[i].toDisplayString() ?? ''),
    );
    _minMinutes = TextEditingController(text: '${d?.minimumChargeMinutes ?? 0}');
    _rounding = TextEditingController(text: '${d?.roundingIncrementMinutes ?? 1}');
  }

  @override
  void dispose() {
    _name.dispose();
    for (final c in _rates) {
      c.dispose();
    }
    _minMinutes.dispose();
    _rounding.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final name = _name.text.trim();
    final rates = <Money>[];
    for (final c in _rates) {
      final m = parseMoney(c.text);
      if (m != null) rates.add(m);
    }
    final minMinutes = int.tryParse(_minMinutes.text.trim());
    final rounding = int.tryParse(_rounding.text.trim());

    String? error;
    if (name.isEmpty) {
      error = 'أدخل اسم الجهاز';
    } else if (rates.length != PlayStationDevice.maxPlayers) {
      error = 'أدخل سعرًا صالحًا لكل عدد لاعبين (1 إلى 4)';
    } else if (minMinutes == null || minMinutes < 0) {
      error = 'أقل مدة محتسبة غير صالحة';
    } else if (rounding == null || rounding < 1) {
      error = 'وحدة التقريب يجب أن تكون 1 أو أكثر';
    }
    if (error != null) {
      setState(() => _error = error);
      return;
    }

    setState(() {
      _saving = true;
      _error = null;
    });
    try {
      final cubit = context.read<PlayStationCubit>();
      if (widget.existing != null) {
        await cubit.updateDevice(widget.existing!.copyWith(
          name: name,
          hourlyRates: rates,
          minimumChargeMinutes: minMinutes,
          roundingIncrementMinutes: rounding,
        ));
      } else {
        await cubit.addDevice(PlayStationDevice(
          id: 0,
          name: name,
          hourlyRates: rates,
          minimumChargeMinutes: minMinutes!,
          roundingIncrementMinutes: rounding!,
        ));
      }
      if (mounted) Navigator.of(context).pop();
    } catch (e) {
      setState(() {
        _saving = false;
        _error = 'تعذّر الحفظ (قد يكون الاسم مكررًا): $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.existing == null ? 'إضافة جهاز بلايستيشن' : 'تعديل جهاز'),
      content: SizedBox(
        width: 360,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _name,
                autofocus: true,
                decoration: const InputDecoration(labelText: 'اسم الجهاز (مثال: PS 1)'),
              ),
              const SizedBox(height: Dimensions.spaceM),
              for (var i = 0; i < PlayStationDevice.maxPlayers; i++) ...[
                adminNumberField(
                  controller: _rates[i],
                  label: 'سعر الساعة — ${i + 1} لاعب',
                  decimal: true,
                  icon: Icons.payments_outlined,
                ),
                const SizedBox(height: Dimensions.spaceS),
              ],
              adminNumberField(controller: _minMinutes, label: 'أقل مدة محتسبة (دقائق، 0 = بدون)'),
              const SizedBox(height: Dimensions.spaceS),
              adminNumberField(controller: _rounding, label: 'التقريب لأقرب (دقائق، 1 = بدون تقريب)'),
              if (_error != null) ...[
                const SizedBox(height: Dimensions.spaceS),
                Text(_error!, style: const TextStyle(color: ColorPalette.danger)),
              ],
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _saving ? null : () => Navigator.of(context).pop(),
          child: const Text('إلغاء'),
        ),
        ElevatedButton(onPressed: _saving ? null : _save, child: const Text('حفظ')),
      ],
    );
  }
}
