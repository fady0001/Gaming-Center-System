import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/domain/entities/billing_rate.dart';
import '../../carts/presentation/cubit/carts_cubit.dart';
import '../../computers/presentation/cubit/computers_cubit.dart';
import '../../playstation/presentation/cubit/playstation_cubit.dart';
import '../../sessions/domain/entities/active_session.dart';
import '../../sessions/presentation/cubit/active_sessions_cubit.dart';
import '../../tables/presentation/cubit/tables_cubit.dart';
import '../domain/entities/booking.dart';
import 'cubit/bookings_cubit.dart';

/// "تحويل إلى سلة": ينشئ سلة باسم الزبون ويضيف عليها جلسة وقت محدد على الجهاز
/// المحجوز بمدة الحجز نفسها (نهاية − بداية)، ثم يعلّم الحجز "تحوّل إلى سلة".
/// تُفحص كل الشروط (الجهاز موجود، ليس في الصيانة، وغير مشغول) قبل إنشاء السلة.
class BookingConverter {
  final BookingsCubit _bookings;
  final CartsCubit _carts;
  final ActiveSessionsCubit _sessions;
  final PlayStationCubit _playstations;
  final ComputersCubit _computers;
  final TablesCubit _tables;

  BookingConverter(
    this._bookings,
    this._carts,
    this._sessions,
    this._playstations,
    this._computers,
    this._tables,
  );

  factory BookingConverter.fromContext(BuildContext context) =>
      BookingConverter(
        context.read<BookingsCubit>(),
        context.read<CartsCubit>(),
        context.read<ActiveSessionsCubit>(),
        context.read<PlayStationCubit>(),
        context.read<ComputersCubit>(),
        context.read<TablesCubit>(),
      );

  /// يعيد معرّف السلة الجديدة. يرمي [StateError] برسالة عربية عند الفشل.
  Future<int> convert(Booking b) async {
    if (b.status != BookingStatus.scheduled) {
      throw StateError('هذا الحجز لم يعد قابلًا للتحويل');
    }
    if (_sessions.state.sessionForResource(b.resourceId, type: b.resourceType) !=
        null) {
      throw StateError('"${b.resourceName}" مشغول حاليًا');
    }

    final BillingRate rate;
    int? players;
    switch (b.resourceType) {
      case SessionResourceType.billiardTable:
        final matches =
            _tables.state.tables.where((t) => t.id == b.resourceId);
        if (matches.isEmpty) throw StateError('الطاولة لم تعد متاحة');
        if (matches.first.isUnderMaintenance) {
          throw StateError('"${b.resourceName}" في الصيانة');
        }
        rate = matches.first.defaultRate;
      case SessionResourceType.playstationDevice:
        final matches =
            _playstations.state.devices.where((d) => d.id == b.resourceId);
        if (matches.isEmpty) throw StateError('الجهاز لم يعد متاحًا');
        if (matches.first.isUnderMaintenance) {
          throw StateError('"${b.resourceName}" في الصيانة');
        }
        rate = matches.first.rateFor(1);
        players = 1;
      case SessionResourceType.cybercafeDevice:
        final matches =
            _computers.state.devices.where((d) => d.id == b.resourceId);
        if (matches.isEmpty) throw StateError('الجهاز لم يعد متاحًا');
        if (matches.first.isUnderMaintenance) {
          throw StateError('"${b.resourceName}" في الصيانة');
        }
        rate = matches.first.rate;
    }

    final minutes = b.duration.inMinutes;
    if (minutes <= 0) throw StateError('مدة الحجز غير صالحة');

    final cart = await _carts.createCart(b.customerName);
    await _carts.addPlayLine(
      cartId: cart.id,
      resourceType: b.resourceType,
      resourceId: b.resourceId,
      resourceName: b.resourceName,
      rate: rate,
      playerCount: players,
      plannedMinutes: minutes,
    );
    await _bookings.markConverted(b.id, cart.id);
    return cart.id;
  }
}
