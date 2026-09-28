import 'package:isar/isar.dart';

import '../../../../core/domain/entities/billing_rate.dart';
import '../../../../core/domain/usecases/calculate_session_charge.dart';
import '../../../../core/domain/value_objects/money.dart';
import '../../domain/entities/active_session.dart';
import '../../domain/repositories/session_repository.dart';
import '../models/session_model.dart';

class SessionRepositoryImpl implements SessionRepository {
  final Isar _isar;

  /// نفس Use Case المُختبَر بالكامل في core/domain — لا يوجد أي حساب مالي
  /// مكرر أو مختلف هنا. طبقة الـ Data تستدعيه فقط ولا تعيد كتابة منطقه أبدًا.
  static const _calculateCharge = CalculateSessionCharge();

  SessionRepositoryImpl(this._isar);

  @override
  Future<ActiveSession> startSession({
    required SessionResourceType resourceType,
    required int resourceId,
    required BillingRate rate,
  }) async {
    final existing = await getActiveSessionFor(
      resourceType: resourceType,
      resourceId: resourceId,
    );
    if (existing != null) {
      throw StateError(
        'يوجد بالفعل جلسة نشطة على هذا المورد (رقم $resourceId). '
        'يجب إنهاء الجلسة الحالية أولاً قبل بدء جلسة جديدة.',
      );
    }

    final model = SessionModel.createNew(
      resourceType: resourceType,
      resourceId: resourceId,
      startTime: DateTime.now(),
      rate: rate,
    );

    await _isar.writeTxn(() async {
      await _isar.sessionModels.put(model);
    });

    return model.toEntity();
  }

  @override
  Future<ActiveSession?> getActiveSessionFor({
    required SessionResourceType resourceType,
    required int resourceId,
  }) async {
    final model = await _isar.sessionModels
        .filter()
        .resourceTypeEqualTo(resourceType)
        .resourceIdEqualTo(resourceId)
        .statusEqualTo(SessionStatus.active)
        .findFirst();
    return model?.toEntity();
  }

  @override
  Stream<List<ActiveSession>> watchActiveSessions() {
    return _isar.sessionModels
        .filter()
        .statusEqualTo(SessionStatus.active)
        .watch(fireImmediately: true)
        .map((models) => models.map((m) => m.toEntity()).toList());
  }

  @override
  Future<ActiveSession> addCafeteriaCharge({
    required int sessionId,
    required int amountMinorUnits,
  }) async {
    return _isar.writeTxn<ActiveSession>(() async {
      final model = await _isar.sessionModels.get(sessionId);
      if (model == null) {
        throw ArgumentError('لا توجد جلسة برقم $sessionId.');
      }
      if (model.status != SessionStatus.active) {
        throw StateError('لا يمكن إضافة طلب كافتيريا لجلسة مغلقة بالفعل.');
      }
      model.cafeteriaChargesMinorUnits += amountMinorUnits;
      await _isar.sessionModels.put(model);
      return model.toEntity();
    });
  }

  @override
  Future<SessionCheckoutSummary> closeSession({
    required int sessionId,
    required DateTime endTime,
  }) async {
    return _isar.writeTxn<SessionCheckoutSummary>(() async {
      final model = await _isar.sessionModels.get(sessionId);
      if (model == null) {
        throw ArgumentError('لا توجد جلسة برقم $sessionId.');
      }
      if (model.status != SessionStatus.active) {
        throw StateError('هذه الجلسة مغلقة بالفعل ولا يمكن إغلاقها مرة أخرى.');
      }

      final rate = BillingRate(
        ratePerHour: Money(model.rateSnapshotMinorUnitsPerHour),
        minimumChargeMinutes: model.rateSnapshotMinimumChargeMinutes,
        roundingIncrementMinutes: model.rateSnapshotRoundingIncrementMinutes,
      );

      final charge = _calculateCharge(
        startTime: model.startTime,
        endTime: endTime,
        rate: rate,
      );

      model.endTime = endTime;
      model.status = SessionStatus.closed;
      await _isar.sessionModels.put(model);

      final cafeteriaCharge = Money(model.cafeteriaChargesMinorUnits);
      final total = charge.amount + cafeteriaCharge;

      return SessionCheckoutSummary(
        session: model.toEntity(),
        billedDuration: charge.billedDuration,
        timeCharge: charge.amount,
        cafeteriaCharge: cafeteriaCharge,
        total: total,
      );
    });
  }
}
