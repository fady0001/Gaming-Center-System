import 'package:isar/isar.dart';

import '../../../../core/domain/entities/billing_rate.dart';
import '../../../../core/domain/value_objects/money.dart';
import '../../domain/entities/table_entity.dart';

part 'table_model.g.dart';

/// يحتاج توليد كود: dart run build_runner build --delete-conflicting-outputs
@collection
class TableModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, caseSensitive: false)
  late String name;

  @Enumerated(EnumType.name)
  late TableType type;

  late int rateMinorUnitsPerHour;
  late int minimumChargeMinutes;
  late int roundingIncrementMinutes;

  @Index()
  bool isActiveFlag = true;

  /// الأجهزة القديمة تقرأ false تلقائيًا.
  bool isUnderMaintenance = false;

  TableEntity toEntity() {
    return TableEntity(
      id: id,
      name: name,
      type: type,
      defaultRate: BillingRate(
        ratePerHour: Money(rateMinorUnitsPerHour),
        minimumChargeMinutes: minimumChargeMinutes,
        roundingIncrementMinutes: roundingIncrementMinutes,
      ),
      isActive: isActiveFlag,
      isUnderMaintenance: isUnderMaintenance,
    );
  }

  static TableModel fromEntity(TableEntity entity) {
    return TableModel()
      ..id = entity.id == 0 ? Isar.autoIncrement : entity.id
      ..name = entity.name
      ..type = entity.type
      ..rateMinorUnitsPerHour = entity.defaultRate.ratePerHour.minorUnits
      ..minimumChargeMinutes = entity.defaultRate.minimumChargeMinutes
      ..roundingIncrementMinutes =
          entity.defaultRate.roundingIncrementMinutes
      ..isActiveFlag = entity.isActive
      ..isUnderMaintenance = entity.isUnderMaintenance;
  }
}
