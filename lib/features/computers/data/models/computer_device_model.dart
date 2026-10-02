import 'package:isar/isar.dart';

import '../../../../core/domain/value_objects/money.dart';
import '../../domain/entities/computer_device.dart';

part 'computer_device_model.g.dart';

/// يحتاج توليد كود: dart run build_runner build --delete-conflicting-outputs
@collection
class ComputerDeviceModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, caseSensitive: false)
  late String name;

  late int rateMinorUnitsPerHour;
  late int minimumChargeMinutes;
  late int roundingIncrementMinutes;

  @Index()
  bool isActiveFlag = true;

  /// الأجهزة القديمة تقرأ false تلقائيًا.
  bool isUnderMaintenance = false;

  ComputerDevice toEntity() {
    return ComputerDevice(
      id: id,
      name: name,
      hourlyRate: Money(rateMinorUnitsPerHour),
      minimumChargeMinutes: minimumChargeMinutes,
      roundingIncrementMinutes: roundingIncrementMinutes,
      isActive: isActiveFlag,
      isUnderMaintenance: isUnderMaintenance,
    );
  }

  static ComputerDeviceModel fromEntity(ComputerDevice e) {
    return ComputerDeviceModel()
      ..id = e.id == 0 ? Isar.autoIncrement : e.id
      ..name = e.name
      ..rateMinorUnitsPerHour = e.hourlyRate.minorUnits
      ..minimumChargeMinutes = e.minimumChargeMinutes
      ..roundingIncrementMinutes = e.roundingIncrementMinutes
      ..isActiveFlag = e.isActive
      ..isUnderMaintenance = e.isUnderMaintenance;
  }
}
