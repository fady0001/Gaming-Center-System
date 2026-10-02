import 'package:isar/isar.dart';

import '../../../sessions/domain/entities/active_session.dart';
import '../../domain/entities/booking.dart';
import '../../domain/repositories/booking_repository.dart';
import '../../domain/usecases/booking_rules.dart';
import '../models/booking_model.dart';

class BookingRepositoryImpl implements BookingRepository {
  final Isar _isar;

  BookingRepositoryImpl(this._isar);

  @override
  Stream<List<Booking>> watchAll() {
    return _isar.bookingModels
        .where()
        .sortByStartAt()
        .watch(fireImmediately: true)
        .map((models) => models.map((m) => m.toEntity()).toList());
  }

  @override
  Future<Booking> create({
    required String customerName,
    required String phone,
    required SessionResourceType resourceType,
    required int resourceId,
    required String resourceName,
    required DateTime startAt,
    required DateTime endAt,
  }) {
    final name = customerName.trim();
    final phoneTrimmed = phone.trim();
    if (name.isEmpty) {
      throw const BookingValidationException('اسم الزبون مطلوب');
    }
    if (phoneTrimmed.isEmpty) {
      throw const BookingValidationException('رقم الهاتف مطلوب');
    }
    if (!endAt.isAfter(startAt)) {
      throw const BookingValidationException(
          'وقت النهاية يجب أن يكون بعد وقت البداية');
    }
    if (startAt.isBefore(DateTime.now().subtract(const Duration(minutes: 5)))) {
      throw const BookingValidationException('لا يمكن إنشاء حجز في وقت مضى');
    }

    // فحص التعارض والحفظ في معاملة واحدة حتى لا يتسلل حجزان متعارضان.
    return _isar.writeTxn(() async {
      final candidates = await _isar.bookingModels
          .filter()
          .resourceTypeEqualTo(resourceType)
          .and()
          .resourceIdEqualTo(resourceId)
          .and()
          .startAtLessThan(endAt)
          .and()
          .endAtGreaterThan(startAt)
          .findAll();

      // الملغى لا يشغل الوقت؛ المحوَّل إلى سلة يبقى شاغلًا لموعده.
      for (final existing in candidates) {
        if (existing.status == BookingStatus.cancelled) continue;
        if (bookingsOverlap(
            startAt, endAt, existing.startAt, existing.endAt)) {
          throw BookingConflictException(existing.toEntity());
        }
      }

      final model = BookingModel()
        ..customerName = name
        ..phone = phoneTrimmed
        ..resourceType = resourceType
        ..resourceId = resourceId
        ..resourceName = resourceName
        ..startAt = startAt
        ..endAt = endAt
        ..status = BookingStatus.scheduled
        ..createdAt = DateTime.now();
      await _isar.bookingModels.put(model);
      return model.toEntity();
    });
  }

  Future<void> _update(int id, void Function(BookingModel m) change) {
    return _isar.writeTxn(() async {
      final m = await _isar.bookingModels.get(id);
      if (m == null) throw StateError('الحجز غير موجود');
      change(m);
      await _isar.bookingModels.put(m);
    });
  }

  @override
  Future<void> cancel(int id) => _update(id, (m) {
        if (m.status != BookingStatus.scheduled) {
          throw StateError('لا يمكن إلغاء هذا الحجز');
        }
        m.status = BookingStatus.cancelled;
      });

  @override
  Future<void> markConverted(int id, int cartId) => _update(id, (m) {
        m.status = BookingStatus.converted;
        m.convertedCartId = cartId;
      });

  @override
  Future<void> markReminderShown(int id) =>
      _update(id, (m) => m.reminderShownAt = DateTime.now());
}
