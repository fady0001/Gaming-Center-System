import 'package:isar/isar.dart';

import '../../../../core/domain/entities/billing_rate.dart';
import '../../../../core/domain/value_objects/money.dart';
import '../../domain/entities/active_session.dart';

part 'session_model.g.dart';

/// ملاحظة تشغيلية: هذا الملف يحتاج توليد كود عبر:
///   dart run build_runner build --delete-conflicting-outputs
/// ولن يُصرَّف المشروع قبل تنفيذ هذا الأمر (ملف session_model.g.dart
/// غير موجود بعد لأنه يُولَّد آليًا).

@collection
class SessionModel {
  Id id = Isar.autoIncrement;

  /// نخزّن الـ Enum بالاسم (EnumType.name) وليس بالترتيب الرقمي (ordinal).
  /// هذا قرار أمان بيانات مهم: لو أضاف مطوّر لاحقًا قيمة جديدة في منتصف
  /// الـ enum (بدل آخره)، التخزين بالترتيب الرقمي كان سيقلب معنى كل
  /// الجلسات القديمة المخزَّنة بصمت دون أي خطأ ظاهر. التخزين بالاسم يمنع
  /// هذه الكارثة تمامًا.
  @Enumerated(EnumType.name)
  late SessionResourceType resourceType;

  @Index()
  late int resourceId;

  @Index()
  late DateTime startTime;

  DateTime? endTime;

  // --- لقطة قاعدة التسعير وقت بدء الجلسة (مفلطحة لأن Isar Embedded Objects
  // تُعقّد المخطط دون فائدة حقيقية هنا؛ 3 حقول بسيطة كافية تمامًا) ---
  late int rateSnapshotMinorUnitsPerHour;
  late int rateSnapshotMinimumChargeMinutes;
  late int rateSnapshotRoundingIncrementMinutes;

  late int cafeteriaChargesMinorUnits;

  @Enumerated(EnumType.name)
  late SessionStatus status;

  // ملاحظة: لا نضيف getter محسوب مثل "isActive" هنا. Isar يتطلب أن يكون كل
  // حقل قابلاً للقراءة والكتابة ليُدرَج في المخطط (Schema)، وgetter بلا
  // setter إما يُهمَل أو يسبب خطأ توليد كود. الاعتماد على حقل status نفسه
  // كافٍ تمامًا للاستعلام عن الجلسات النشطة (status == SessionStatus.active).

  /// تحويل من نموذج التخزين إلى كيان الدومين النظيف (Domain Entity).
  ActiveSession toEntity() {
    return ActiveSession(
      id: id,
      resourceType: resourceType,
      resourceId: resourceId,
      startTime: startTime,
      endTime: endTime,
      rateSnapshot: BillingRate(
        ratePerHour: Money(rateSnapshotMinorUnitsPerHour),
        minimumChargeMinutes: rateSnapshotMinimumChargeMinutes,
        roundingIncrementMinutes: rateSnapshotRoundingIncrementMinutes,
      ),
      cafeteriaCharges: Money(cafeteriaChargesMinorUnits),
      status: status,
    );
  }

  /// إنشاء نموذج تخزين جديد من بيانات بدء جلسة (لا يُستخدم عند التحديث).
  static SessionModel createNew({
    required SessionResourceType resourceType,
    required int resourceId,
    required DateTime startTime,
    required BillingRate rate,
  }) {
    return SessionModel()
      ..resourceType = resourceType
      ..resourceId = resourceId
      ..startTime = startTime
      ..endTime = null
      ..rateSnapshotMinorUnitsPerHour = rate.ratePerHour.minorUnits
      ..rateSnapshotMinimumChargeMinutes = rate.minimumChargeMinutes
      ..rateSnapshotRoundingIncrementMinutes = rate.roundingIncrementMinutes
      ..cafeteriaChargesMinorUnits = 0
      ..status = SessionStatus.active;
  }
}
