import '../../../../core/utils/arabic_search.dart';
import '../../../devices/domain/entities/unified_device.dart';
import '../entities/cart.dart';

/// فلترة وترتيب قائمة السلال: الأحدث أولًا دائمًا.
///  - [status] == active: سلال فيها جهاز/طاولة يعمل الآن.
///  - [status] == idle: سلال بلا أي جلسة جارية (طلبات منيو فقط أو جلساتها انتهت).
///  - [status] == maintenance: لا توجد سلة "معطلة" (الصفحة تعرض الأجهزة بدلها).
///  - [query]: بحث باسم الزبون (يتجاهل التشكيل واختلاف الألف/الياء/التاء).
List<Cart> filterCarts(
  List<Cart> carts, {
  DeviceStatus? status,
  String query = '',
}) {
  final q = normalizeForSearch(query);

  bool hasRunning(Cart c) => c.playLines.any((l) => !l.isSettled);

  final result = carts.where((c) {
    if (q.isNotEmpty && !normalizeForSearch(c.customerName).contains(q)) {
      return false;
    }
    switch (status) {
      case null:
        return true;
      case DeviceStatus.active:
        return hasRunning(c);
      case DeviceStatus.idle:
        return !hasRunning(c);
      case DeviceStatus.maintenance:
        return false;
    }
  }).toList();

  result.sort((a, b) {
    final byTime = b.createdAt.compareTo(a.createdAt);
    return byTime != 0 ? byTime : b.id.compareTo(a.id);
  });
  return result;
}
