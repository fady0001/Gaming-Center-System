import 'package:isar/isar.dart';

part 'work_day_model.g.dart';

@collection
class WorkDayModel {
  Id id = Isar.autoIncrement;

  @Index()
  late DateTime startedAt;

  DateTime? endedAt;
}
