import '../../../../core/domain/value_objects/money.dart';
import '../../../bookings/domain/entities/booking.dart';
import '../../../carts/domain/entities/cart.dart';

class AnalyticsKpis {
  /// إجمالي إيراد الفواتير المغلقة في الفترة.
  final Money revenue;

  /// جزء الإيراد من وقت اللعب / من المنيو.
  final Money playTotal;
  final Money itemsTotal;

  final int completedCarts;

  /// حجوزات قادمة لم تنتهِ ولم تُلغَ ولم تتحول (الآن).
  final int activeReservations;

  const AnalyticsKpis({
    required this.revenue,
    required this.playTotal,
    required this.itemsTotal,
    required this.completedCarts,
    required this.activeReservations,
  });

  /// لا توجد طرق دفع أو مصاريف في النظام بعد، فكل المبالغ نقدية والصندوق
  /// يساوي الإيراد. عند إضافة مصاريف/سحوبات يُخصم منه هنا.
  Money get cashBox => revenue;
}

AnalyticsKpis computeKpis({
  required List<Cart> closedCarts,
  required List<Booking> bookings,
  required DateTime now,
}) {
  var revenue = 0;
  var items = 0;
  var count = 0;
  for (final c in closedCarts) {
    final total = c.finalTotal;
    if (c.status != CartStatus.closed || total == null) continue;
    count++;
    revenue += total.minorUnits;
    items += c.itemsTotal.minorUnits;
  }
  final play = revenue - items;

  final active = bookings
      .where((b) => b.status == BookingStatus.scheduled && b.endAt.isAfter(now))
      .length;

  return AnalyticsKpis(
    revenue: Money(revenue),
    playTotal: Money(play < 0 ? 0 : play),
    itemsTotal: Money(items),
    completedCarts: count,
    activeReservations: active,
  );
}
