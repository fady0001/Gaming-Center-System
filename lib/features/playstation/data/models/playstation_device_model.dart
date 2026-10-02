import 'package:isar/isar.dart';

import '../../../../core/domain/value_objects/money.dart';
import '../../domain/entities/playstation_device.dart';

part 'playstation_device_model.g.dart';

/// يحتاج توليد كود: dart run build_runner build --delete-conflicting-outputs
@collection
class PlayStationDeviceModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, caseSensitive: false)
  late String name;

  // أربعة أسعار مفلطحة (لاعب/لاعبان/ثلاثة/أربعة) - نفس أسلوب باقي المشروع.
  late int rate1MinorUnits;
  late int rate2MinorUnits;
  late int rate3MinorUnits;
  late int rate4MinorUnits;

  late int minimumChargeMinutes;
  late int roundingIncrementMinutes;

  @Index()
  bool isActiveFlag = true;

  /// الأجهزة القديمة تقرأ false تلقائيًا.
  bool isUnderMaintenance = false;

  PlayStationDevice toEntity() {
    return PlayStationDevice(
      id: id,
      name: name,
      hourlyRates: [
        Money(rate1MinorUnits),
        Money(rate2MinorUnits),
        Money(rate3MinorUnits),
        Money(rate4MinorUnits),
      ],
      minimumChargeMinutes: minimumChargeMinutes,
      roundingIncrementMinutes: roundingIncrementMinutes,
      isActive: isActiveFlag,
      isUnderMaintenance: isUnderMaintenance,
    );
  }

  static PlayStationDeviceModel fromEntity(PlayStationDevice e) {
    return PlayStationDeviceModel()
      ..id = e.id == 0 ? Isar.autoIncrement : e.id
      ..name = e.name
      ..rate1MinorUnits = e.hourlyRates[0].minorUnits
      ..rate2MinorUnits = e.hourlyRates[1].minorUnits
      ..rate3MinorUnits = e.hourlyRates[2].minorUnits
      ..rate4MinorUnits = e.hourlyRates[3].minorUnits
      ..minimumChargeMinutes = e.minimumChargeMinutes
      ..roundingIncrementMinutes = e.roundingIncrementMinutes
      ..isActiveFlag = e.isActive
      ..isUnderMaintenance = e.isUnderMaintenance;
  }
}
