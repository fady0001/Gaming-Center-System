import 'package:isar/isar.dart';

import '../../../carts/data/models/cart_models.dart';
import '../../../carts/domain/entities/cart.dart';
import '../../domain/entities/work_day.dart';
import '../../domain/repositories/work_day_repository.dart';
import '../models/work_day_model.dart';
import '../work_day_store.dart';

class WorkDayRepositoryImpl implements WorkDayRepository {
  final Isar _isar;

  WorkDayRepositoryImpl(this._isar);

  WorkDay _toEntity(WorkDayModel m) =>
      WorkDay(id: m.id, startedAt: m.startedAt, endedAt: m.endedAt);

  @override
  Future<WorkDay> currentDay() async {
    final open = await WorkDayStore.findOpen(_isar);
    if (open != null) return _toEntity(open);
    final created =
        await _isar.writeTxn(() => WorkDayStore.ensureOpenDay(_isar));
    return _toEntity(created);
  }

  @override
  Stream<WorkDay> watchCurrentDay() async* {
    yield await currentDay();
    await for (final _ in _isar.workDayModels.watchLazy()) {
      yield await currentDay();
    }
  }

  @override
  Future<({WorkDay archived, WorkDay next})> rollOver() {
    return _isar.writeTxn(() async {
      final current = await WorkDayStore.ensureOpenDay(_isar);

      final stillOpen = await _isar.cartModels
          .filter()
          .statusEqualTo(CartStatus.open)
          .count();
      if (stillOpen > 0) {
        throw StateError(
            'توجد $stillOpen سلة مفتوحة. يجب محاسبتها قبل إنشاء يوم جديد.');
      }

      final now = DateTime.now();
      current.endedAt = now;
      await _isar.workDayModels.put(current);

      final next = WorkDayModel()..startedAt = now;
      await _isar.workDayModels.put(next);

      return (archived: _toEntity(current), next: _toEntity(next));
    });
  }

  @override
  Future<List<WorkDay>> archivedDays({int limit = 365}) async {
    final models = await _isar.workDayModels
        .filter()
        .endedAtIsNotNull()
        .sortByStartedAtDesc()
        .limit(limit)
        .findAll();
    return models.map(_toEntity).toList();
  }
}
