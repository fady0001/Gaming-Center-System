import '../../../sessions/domain/entities/active_session.dart';
import '../entities/booking.dart';

abstract class BookingRepository {
  /// كل الحجوزات (كل الحالات) مرتبة بوقت البداية.
  Stream<List<Booking>> watchAll();

  /// يرمي [BookingValidationException] أو [BookingConflictException].
  Future<Booking> create({
    required String customerName,
    required String phone,
    required SessionResourceType resourceType,
    required int resourceId,
    required String resourceName,
    required DateTime startAt,
    required DateTime endAt,
  });

  Future<void> cancel(int id);

  Future<void> markConverted(int id, int cartId);

  Future<void> markReminderShown(int id);
}
