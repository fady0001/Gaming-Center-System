import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/color_palette.dart';
import '../../../../core/theme/dimensions.dart';
import '../../../../core/utils/time_format.dart';
import '../../../carts/presentation/pages/cart_detail_page.dart';
import '../../domain/entities/booking.dart';
import '../../domain/usecases/booking_rules.dart';
import '../booking_converter.dart';
import '../cubit/bookings_cubit.dart';
import '../widgets/booking_form_dialog.dart';

/// صفحة الحجوزات: حجوزات يوم معيّن + بحث باسم الزبون + حجز جديد.
class BookingsPage extends StatefulWidget {
  const BookingsPage({super.key});

  @override
  State<BookingsPage> createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage> {
  late DateTime _day;
  String _query = '';
  final _search = TextEditingController();

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _day = DateTime(now.year, now.month, now.day);
  }

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  void _shift(int days) =>
      setState(() => _day = _day.add(Duration(days: days)));

  Future<void> _pickDay() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _day,
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() => _day = DateTime(picked.year, picked.month, picked.day));
    }
  }

  Future<void> _convert(Booking b) async {
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    try {
      final cartId = await BookingConverter.fromContext(context).convert(b);
      navigator.push(
        MaterialPageRoute(builder: (_) => CartDetailPage(cartId: cartId)),
      );
    } catch (e) {
      messenger.showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  Future<void> _cancel(Booking b) async {
    final cubit = context.read<BookingsCubit>();
    final messenger = ScaffoldMessenger.of(context);
    final ok = await showDialog<bool>(
      context: context,
      builder: (d) => AlertDialog(
        title: const Text('إلغاء الحجز'),
        content: Text('إلغاء حجز ${b.customerName} على ${b.resourceName}؟'),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(d).pop(false),
              child: const Text('رجوع')),
          ElevatedButton(
              onPressed: () => Navigator.of(d).pop(true),
              child: const Text('إلغاء الحجز')),
        ],
      ),
    );
    if (ok != true) return;
    try {
      await cubit.cancel(b.id);
    } catch (e) {
      messenger.showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الحجوزات')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => BookingFormDialog.show(context, day: _day),
        icon: const Icon(Icons.add),
        label: const Text('حجز جديد'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(Dimensions.spaceM),
            child: Row(
              children: [
                IconButton(
                  tooltip: 'اليوم السابق',
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () => _shift(-1),
                ),
                TextButton.icon(
                  onPressed: _pickDay,
                  icon: const Icon(Icons.calendar_today_outlined),
                  label: Text(formatDate(_day)),
                ),
                IconButton(
                  tooltip: 'اليوم التالي',
                  icon: const Icon(Icons.chevron_left),
                  onPressed: () => _shift(1),
                ),
                TextButton(
                  onPressed: () {
                    final now = DateTime.now();
                    setState(
                        () => _day = DateTime(now.year, now.month, now.day));
                  },
                  child: const Text('اليوم'),
                ),
                const SizedBox(width: Dimensions.spaceM),
                Expanded(
                  child: TextField(
                    controller: _search,
                    onChanged: (v) => setState(() => _query = v),
                    decoration: InputDecoration(
                      hintText: 'بحث باسم الزبون',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: _query.isEmpty
                          ? null
                          : IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                _search.clear();
                                setState(() => _query = '');
                              },
                            ),
                      border: const OutlineInputBorder(),
                      isDense: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<BookingsCubit, BookingsState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                final list =
                    filterBookings(state.bookings, day: _day, query: _query);
                if (list.isEmpty) {
                  return const Center(
                      child: Text('لا توجد حجوزات في هذا اليوم.'));
                }
                return ListView.separated(
                  padding: const EdgeInsets.all(Dimensions.spaceM),
                  itemCount: list.length,
                  separatorBuilder: (_, __) =>
                      const SizedBox(height: Dimensions.spaceS),
                  itemBuilder: (_, i) => _BookingCard(
                    booking: list[i],
                    onConvert: () => _convert(list[i]),
                    onCancel: () => _cancel(list[i]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _BookingCard extends StatelessWidget {
  final Booking booking;
  final VoidCallback onConvert;
  final VoidCallback onCancel;

  const _BookingCard({
    required this.booking,
    required this.onConvert,
    required this.onCancel,
  });

  Color get _color {
    switch (booking.status) {
      case BookingStatus.scheduled:
        return ColorPalette.statusIdle;
      case BookingStatus.converted:
        return ColorPalette.statusActive;
      case BookingStatus.cancelled:
        return ColorPalette.statusMaintenance;
    }
  }

  @override
  Widget build(BuildContext context) {
    final b = booking;
    final isScheduled = b.status == BookingStatus.scheduled;
    return Card(
      child: ListTile(
        leading: Icon(Icons.event_available_outlined, color: _color),
        title: Text('${b.customerName} — ${b.resourceName}'),
        subtitle: Text('${b.timeRangeLabel}  •  ${b.phone}\n${b.status.arabicLabel}'),
        isThreeLine: true,
        trailing: isScheduled
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton.icon(
                    onPressed: onConvert,
                    icon: const Icon(Icons.shopping_basket_outlined),
                    label: const Text('تحويل إلى سلة'),
                  ),
                  IconButton(
                    tooltip: 'إلغاء الحجز',
                    icon: const Icon(Icons.cancel_outlined),
                    onPressed: onCancel,
                  ),
                ],
              )
            : null,
      ),
    );
  }
}
