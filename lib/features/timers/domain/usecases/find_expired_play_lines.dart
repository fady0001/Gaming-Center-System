import '../../../carts/domain/entities/cart.dart';
import '../entities/expiry_alert.dart';

/// الجلسات محددة الوقت التي انتهت مدتها ولم يُنبَّه عنها بعد.
/// - تتجاهل الجلسات المفتوحة والمحاسَبة والسلال المغلقة.
/// - [alreadyAlerted] مجموعة معرّفات play lines التي نُبّه عنها سابقًا.
List<ExpiryAlert> findExpiredPlayLines(
  List<Cart> carts,
  DateTime now,
  Set<int> alreadyAlerted,
) {
  final result = <ExpiryAlert>[];
  for (final cart in carts) {
    if (!cart.isOpen) continue;
    for (final line in cart.playLines) {
      final planned = line.plannedMinutes;
      if (line.isSettled || planned == null) continue;
      if (alreadyAlerted.contains(line.id)) continue;
      final elapsed = now.difference(line.startedAt);
      if (elapsed >= Duration(minutes: planned)) {
        result.add(ExpiryAlert(
          cartId: cart.id,
          playLineId: line.id,
          customerName: cart.customerName,
          deviceName: line.resourceName,
          plannedMinutes: planned,
          elapsed: elapsed,
        ));
      }
    }
  }
  return result;
}

/// معرّفات الجلسات التي ما زالت محددة الوقت وغير محاسَبة (لتنظيف مجموعة التنبيهات).
Set<int> liveFixedTimeLineIds(List<Cart> carts) => {
      for (final c in carts.where((c) => c.isOpen))
        for (final l in c.playLines)
          if (!l.isSettled && l.plannedMinutes != null) l.id,
    };
