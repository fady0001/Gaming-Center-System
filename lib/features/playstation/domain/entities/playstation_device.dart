import '../../../../core/domain/entities/billing_rate.dart';
import '../../../../core/domain/value_objects/money.dart';

/// جهاز بلايستيشن واحد. سعر الساعة يختلف حسب عدد اللاعبين (1 إلى 4)،
/// فيحمل الجهاز أربعة أسعار: [hourlyRates] الفهرس 0 = لاعب واحد ... 3 = أربعة.
class PlayStationDevice {
  static const int maxPlayers = 4;

  final int id;
  final String name;
  final List<Money> hourlyRates;
  final int minimumChargeMinutes;
  final int roundingIncrementMinutes;

  /// تعطيل بدل حذف (نفس منطق الطاولات والمنيو).
  final bool isActive;

  const PlayStationDevice({
    required this.id,
    required this.name,
    required this.hourlyRates,
    this.minimumChargeMinutes = 0,
    this.roundingIncrementMinutes = 1,
    this.isActive = true,
  }) : assert(hourlyRates.length == maxPlayers);

  /// قاعدة التسعير الخاصة بعدد لاعبين معيّن. تُنسخ كـ"لقطة" داخل الجلسة
  /// عند بدئها، فتغيير الأسعار لاحقًا لا يمس جلسة جارية.
  BillingRate rateFor(int players) {
    assert(players >= 1 && players <= maxPlayers);
    return BillingRate(
      ratePerHour: hourlyRates[players - 1],
      minimumChargeMinutes: minimumChargeMinutes,
      roundingIncrementMinutes: roundingIncrementMinutes,
    );
  }

  PlayStationDevice copyWith({
    String? name,
    List<Money>? hourlyRates,
    int? minimumChargeMinutes,
    int? roundingIncrementMinutes,
    bool? isActive,
  }) {
    return PlayStationDevice(
      id: id,
      name: name ?? this.name,
      hourlyRates: hourlyRates ?? this.hourlyRates,
      minimumChargeMinutes: minimumChargeMinutes ?? this.minimumChargeMinutes,
      roundingIncrementMinutes:
          roundingIncrementMinutes ?? this.roundingIncrementMinutes,
      isActive: isActive ?? this.isActive,
    );
  }
}
