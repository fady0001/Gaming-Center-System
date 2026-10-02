import '../entities/work_day.dart';

abstract class WorkDayRepository {
  /// اليوم المفتوح حاليًا (يُنشأ تلقائيًا إن لم يوجد).
  Future<WorkDay> currentDay();

  Stream<WorkDay> watchCurrentDay();

  /// يغلق اليوم الحالي ويفتح يومًا جديدًا في معاملة واحدة.
  /// يرمي [StateError] إن بقيت سلال مفتوحة (لا تُؤرشف سلة مفتوحة).
  Future<({WorkDay archived, WorkDay next})> rollOver();

  /// الأيام المؤرشفة، الأحدث أولًا.
  Future<List<WorkDay>> archivedDays({int limit = 365});
}
