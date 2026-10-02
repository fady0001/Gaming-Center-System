import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/alerts/alert_center.dart';
import '../../../../core/theme/color_palette.dart';
import '../../../timers/data/expiry_alert_notifier.dart';
import '../../domain/entities/booking.dart';
import '../../domain/usecases/booking_rules.dart';
import '../booking_converter.dart';
import '../cubit/bookings_cubit.dart';

/// تذكير قبل 60 دقيقة من أي حجز قادم: نغمة + إشعار سطح مكتب + تنبيه داخل
/// التطبيق فيه زر "تحويل إلى سلة". يُعرض التذكير مرة واحدة لكل حجز (يُحفظ
/// في قاعدة البيانات فلا يتكرر بعد إعادة تشغيل التطبيق).
class BookingReminderHost extends StatefulWidget {
  final Widget child;
  const BookingReminderHost({super.key, required this.child});

  @override
  State<BookingReminderHost> createState() => _BookingReminderHostState();
}

class _BookingReminderHostState extends State<BookingReminderHost> {
  late final BookingsCubit _bookings;
  late final BookingConverter _converter;
  final Set<int> _handled = {};
  StreamSubscription<BookingsState>? _sub;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _bookings = context.read<BookingsCubit>();
    _converter = BookingConverter.fromContext(context);
    _sub = _bookings.stream.listen((_) => _check());
    _timer = Timer.periodic(const Duration(seconds: 15), (_) => _check());
    _check();
  }

  void _check() {
    if (_bookings.state.isLoading) return;
    final now = DateTime.now();
    final due = findBookingsDueForReminder(_bookings.state.bookings, now)
        .where((b) => !_handled.contains(b.id))
        .toList();
    if (due.isEmpty) return;

    for (final b in due) {
      _handled.add(b.id);
      _bookings.markReminderShown(b.id);
      _show(b, now);
    }
    ExpiryAlertNotifier.instance.playChime();
  }

  void _show(Booking b, DateTime now) {
    final minutes = b.startAt.difference(now).inMinutes;
    final title = minutes > 0 ? 'حجز بعد $minutes دقيقة' : 'حان موعد الحجز';
    final body =
        '${b.customerName} — ${b.resourceName}\n${b.timeRangeLabel}  •  ${b.phone}';
    final id = 'booking-${b.id}';

    ExpiryAlertNotifier.instance.showText(title: title, body: body);
    AlertCenter.instance.show(AppAlert(
      id: id,
      icon: Icons.event_available_outlined,
      color: ColorPalette.primary,
      title: title,
      body: body,
      actionLabel: 'تحويل إلى سلة',
      onAction: () => _convert(b, id),
    ));
  }

  Future<void> _convert(Booking b, String alertId) async {
    try {
      await _converter.convert(b);
      AlertCenter.instance.dismiss(alertId);
      AlertCenter.instance.show(AppAlert(
        id: '$alertId-ok',
        icon: Icons.check_circle_outline,
        color: ColorPalette.success,
        title: 'تم إنشاء السلة',
        body: 'سلة ${b.customerName} على ${b.resourceName} جاهزة في قائمة السلال.',
      ));
    } catch (e) {
      AlertCenter.instance.show(AppAlert(
        id: '$alertId-err',
        icon: Icons.error_outline,
        color: ColorPalette.danger,
        title: 'تعذّر التحويل',
        body: e.toString(),
      ));
    }
  }

  @override
  void dispose() {
    _sub?.cancel();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
