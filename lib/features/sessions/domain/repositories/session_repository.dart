import '../../../../core/domain/entities/billing_rate.dart';
import '../entities/active_session.dart';

/// العقد الذي يجب أن تنفّذه أي طريقة تخزين (Isar حاليًا، أو أي بديل لاحقًا)
/// دون أن تعرف طبقة العرض (Presentation) أي شيء عن التفاصيل التقنية.
abstract class SessionRepository {
  /// يبدأ جلسة جديدة على مورد معيّن. يفشل صراحةً إن كان هناك جلسة نشطة
  /// أصلاً على نفس المورد (لا يمكن لطاولة أن تُشغَّل مرتين في آنٍ واحد).
  Future<ActiveSession> startSession({
    required SessionResourceType resourceType,
    required int resourceId,
    required BillingRate rate,
  });

  /// الجلسة النشطة حاليًا على مورد معيّن، أو null إن كان فارغًا.
  Future<ActiveSession?> getActiveSessionFor({
    required SessionResourceType resourceType,
    required int resourceId,
  });

  /// كل الجلسات النشطة حاليًا (لعرض لوحة الطاولات/الأجهزة بالكامل).
  Stream<List<ActiveSession>> watchActiveSessions();

  /// إضافة طلب كافتيريا على جلسة نشطة (يزيد cafeteriaCharges فقط).
  Future<ActiveSession> addCafeteriaCharge({
    required int sessionId,
    required int amountMinorUnits,
  });

  /// ينهي الجلسة، يحسب فوترة الوقت عبر CalculateSessionCharge، ويعيد
  /// ملخصًا كاملاً جاهزًا لعرضه في شاشة الفاتورة.
  Future<SessionCheckoutSummary> closeSession({
    required int sessionId,
    required DateTime endTime,
  });
}
