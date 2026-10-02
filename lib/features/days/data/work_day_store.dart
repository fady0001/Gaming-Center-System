import 'package:isar/isar.dart';

import '../../carts/data/models/cart_models.dart';
import 'models/work_day_model.dart';

/// منطق مشترك بين مستودعَي الأيام والسلال لضمان وجود يوم مفتوح.
class WorkDayStore {
  WorkDayStore._();

  static Future<WorkDayModel?> findOpen(Isar isar) {
    return isar.workDayModels
        .filter()
        .endedAtIsNull()
        .sortByStartedAtDesc()
        .findFirst();
  }

  /// يجب استدعاؤها داخل `writeTxn`. عند إنشاء أول يوم تُنسب إليه السلال
  /// القديمة (التي لا تحمل dayId) حتى لا تبقى بلا يوم.
  static Future<WorkDayModel> ensureOpenDay(Isar isar) async {
    final open = await findOpen(isar);
    if (open != null) return open;

    final day = WorkDayModel()..startedAt = DateTime.now();
    await isar.workDayModels.put(day);

    final orphans = await isar.cartModels.filter().dayIdIsNull().findAll();
    if (orphans.isNotEmpty) {
      for (final cart in orphans) {
        cart.dayId = day.id;
      }
      await isar.cartModels.putAll(orphans);
    }
    return day;
  }
}
