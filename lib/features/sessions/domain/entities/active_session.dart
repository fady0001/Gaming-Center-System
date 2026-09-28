import '../../../../core/domain/entities/billing_rate.dart';
import '../../../../core/domain/value_objects/money.dart';

/// نوع المورد المرتبط بالجلسة. إضافة نوع جديد لاحقًا (مثال: غرفة VR)
/// تحتاج فقط لإضافة قيمة هنا، بدون أي تغيير في منطق الفوترة نفسه.
enum SessionResourceType { billiardTable, playstationDevice, cybercafeDevice }

enum SessionStatus { active, closed }

/// جلسة زمنية واحدة (طاولة قيد التشغيل، أو جهاز بلايستيشن، أو كمبيوتر).
/// هذا الكيان مستقل تمامًا عن أي تفاصيل قاعدة بيانات (Isar) أو واجهة.
class ActiveSession {
  final int id;
  final SessionResourceType resourceType;

  /// معرّف المورد الفعلي (مثال: رقم الطاولة، أو معرّف جهاز البلايستيشن).
  final int resourceId;

  final DateTime startTime;
  final DateTime? endTime;

  /// **لقطة** من قاعدة التسعير وقت بدء الجلسة، وليست مرجعًا حيًا للسعر
  /// الحالي للطاولة. هذا مقصود ومهم جدًا: إن غيّر صاحب الصالة سعر الساعة
  /// بعد ظهر اليوم، يجب ألا يتأثر حساب جلسة بدأت صباحًا بالسعر القديم.
  final BillingRate rateSnapshot;

  /// إجمالي طلبات الكافتيريا المضافة على هذه الجلسة حتى الآن.
  final Money cafeteriaCharges;

  final SessionStatus status;

  const ActiveSession({
    required this.id,
    required this.resourceType,
    required this.resourceId,
    required this.startTime,
    required this.rateSnapshot,
    this.endTime,
    this.cafeteriaCharges = const Money.zero(),
    this.status = SessionStatus.active,
  });

  bool get isActive => status == SessionStatus.active;

  ActiveSession copyWith({
    DateTime? endTime,
    Money? cafeteriaCharges,
    SessionStatus? status,
  }) {
    return ActiveSession(
      id: id,
      resourceType: resourceType,
      resourceId: resourceId,
      startTime: startTime,
      rateSnapshot: rateSnapshot,
      endTime: endTime ?? this.endTime,
      cafeteriaCharges: cafeteriaCharges ?? this.cafeteriaCharges,
      status: status ?? this.status,
    );
  }
}

/// نتيجة إغلاق جلسة: تفصل بوضوح بين مبلغ الوقت ومبلغ الكافتيريا، لأن
/// شاشة الفاتورة والتقارير تحتاج لعرض كل بند على حدة، لا مجموعًا واحدًا فقط.
class SessionCheckoutSummary {
  final ActiveSession session;
  final Duration billedDuration;
  final Money timeCharge;
  final Money cafeteriaCharge;
  final Money total;

  const SessionCheckoutSummary({
    required this.session,
    required this.billedDuration,
    required this.timeCharge,
    required this.cafeteriaCharge,
    required this.total,
  });
}
