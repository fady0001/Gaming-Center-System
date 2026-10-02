import '../../../../core/domain/entities/billing_rate.dart';
import '../../../../core/domain/value_objects/money.dart';

/// جهاز كمبيوتر واحد (سعر ساعة واحد، بخلاف البلايستيشن الذي يتغير سعره
/// بعدد اللاعبين).
class ComputerDevice {
  final int id;
  final String name;
  final Money hourlyRate;
  final int minimumChargeMinutes;
  final int roundingIncrementMinutes;

  /// تعطيل بدل حذف (نفس منطق باقي الموارد).
  final bool isActive;

  /// في الصيانة: يبقى ظاهرًا في النظام لكن لا يمكن حجزه/تشغيله حتى تنتهي الصيانة.
  /// مختلف عن [isActive] (الإخفاء/الإزالة من الخدمة).
  final bool isUnderMaintenance;

  const ComputerDevice({
    required this.id,
    required this.name,
    required this.hourlyRate,
    this.minimumChargeMinutes = 0,
    this.roundingIncrementMinutes = 1,
    this.isActive = true,
    this.isUnderMaintenance = false,
  });

  /// تُنسخ كـ"لقطة" داخل الجلسة عند بدئها.
  BillingRate get rate => BillingRate(
        ratePerHour: hourlyRate,
        minimumChargeMinutes: minimumChargeMinutes,
        roundingIncrementMinutes: roundingIncrementMinutes,
      );

  ComputerDevice copyWith({
    String? name,
    Money? hourlyRate,
    int? minimumChargeMinutes,
    int? roundingIncrementMinutes,
    bool? isActive,
    bool? isUnderMaintenance,
  }) {
    return ComputerDevice(
      id: id,
      name: name ?? this.name,
      hourlyRate: hourlyRate ?? this.hourlyRate,
      minimumChargeMinutes: minimumChargeMinutes ?? this.minimumChargeMinutes,
      roundingIncrementMinutes:
          roundingIncrementMinutes ?? this.roundingIncrementMinutes,
      isActive: isActive ?? this.isActive,
      isUnderMaintenance: isUnderMaintenance ?? this.isUnderMaintenance,
    );
  }
}
