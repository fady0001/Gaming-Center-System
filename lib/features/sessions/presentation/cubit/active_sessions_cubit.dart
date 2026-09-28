import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/entities/billing_rate.dart';
import '../../domain/entities/active_session.dart';
import '../../domain/repositories/session_repository.dart';

class SessionsState {
  final List<ActiveSession> activeSessions;

  /// "الوقت الحالي" المجمَّد لحظة آخر إصدار حالة، يُستخدم لحساب المدة/السعر
  /// الحي في الواجهة دون أن تعيد كل بطاقة استدعاء DateTime.now() بنفسها
  /// بشكل غير متزامن مع بقية الشاشة.
  final DateTime now;

  const SessionsState({required this.activeSessions, required this.now});

  /// الجلسة النشطة على مورد معيّن. النوع ضروري: طاولة رقم 1 وجهاز
  /// بلايستيشن رقم 1 موردان مختلفان لهما نفس المعرّف الرقمي. الافتراضي
  /// طاولة لتبقى استدعاءات شاشة الطاولات كما هي.
  ActiveSession? sessionForResource(
    int resourceId, {
    SessionResourceType type = SessionResourceType.billiardTable,
  }) {
    for (final session in activeSessions) {
      if (session.resourceId == resourceId && session.resourceType == type) {
        return session;
      }
    }
    return null;
  }
}

/// Cubit وحيد على مستوى التطبيق لكل الجلسات النشطة (طاولات + بلايستيشن +
/// كمبيوترات معًا)، بما أن منطق الجلسة والفوترة مشترك تمامًا بينها.
/// كل ميزة (tables, playstation, cybercafe) تستهلك نفس الـ Cubit وتفلتر
/// بنفسها حسب SessionResourceType المناسب لها.
class ActiveSessionsCubit extends Cubit<SessionsState> {
  final SessionRepository _repository;
  StreamSubscription<List<ActiveSession>>? _subscription;
  Timer? _ticker;

  ActiveSessionsCubit(this._repository)
      : super(SessionsState(activeSessions: const [], now: DateTime.now())) {
    _subscription = _repository.watchActiveSessions().listen((sessions) {
      emit(SessionsState(activeSessions: sessions, now: DateTime.now()));
    });

    // نبض كل ثانية فقط لتحديث "الوقت الحالي" المعروض (المدة والسعر الحي)،
    // دون أي استعلام جديد لقاعدة البيانات - أداء أفضل بكثير من إعادة
    // القراءة كل ثانية لعشرات الطاولات في نفس الوقت.
    _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
      emit(SessionsState(activeSessions: state.activeSessions, now: DateTime.now()));
    });
  }

  Future<void> startSession({
    required SessionResourceType resourceType,
    required int resourceId,
    required BillingRate rate,
  }) {
    return _repository.startSession(
      resourceType: resourceType,
      resourceId: resourceId,
      rate: rate,
    );
  }

  Future<void> addCafeteriaCharge({
    required int sessionId,
    required int amountMinorUnits,
  }) {
    return _repository.addCafeteriaCharge(
      sessionId: sessionId,
      amountMinorUnits: amountMinorUnits,
    );
  }

  Future<SessionCheckoutSummary> closeSession(int sessionId) {
    return _repository.closeSession(
      sessionId: sessionId,
      endTime: DateTime.now(),
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    _ticker?.cancel();
    return super.close();
  }
}
