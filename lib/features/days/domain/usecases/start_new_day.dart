import '../../../carts/domain/repositories/cart_repository.dart';
import '../entities/work_day.dart';
import '../repositories/work_day_repository.dart';

/// "إنشاء يوم جديد": يحاسب السلال المفتوحة (إغلاق الجلسات وحساب الإجمالي
/// بنفس منطق الدفع المعتاد)، ثم يؤرشف اليوم الحالي ويفتح يومًا جديدًا.
class StartNewDay {
  final CartRepository _carts;
  final WorkDayRepository _days;

  StartNewDay(this._carts, this._days);

  Future<DayRollover> call() async {
    final open = await _carts.getOpenCarts();
    for (final cart in open) {
      await _carts.checkout(cart.id);
    }
    final result = await _days.rollOver();
    return DayRollover(
      archivedDay: result.archived,
      newDay: result.next,
      settledCarts: open.length,
    );
  }
}
