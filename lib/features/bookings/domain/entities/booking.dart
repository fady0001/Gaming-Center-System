import '../../../../core/utils/time_format.dart';
import '../../../sessions/domain/entities/active_session.dart';

/// scheduled: حجز قادم · converted: تحوّل إلى سلة · cancelled: ملغى.
enum BookingStatus { scheduled, converted, cancelled }

extension BookingStatusLabel on BookingStatus {
  String get arabicLabel {
    switch (this) {
      case BookingStatus.scheduled:
        return 'قادم';
      case BookingStatus.converted:
        return 'تحوّل إلى سلة';
      case BookingStatus.cancelled:
        return 'ملغى';
    }
  }
}

/// حجز جهاز/طاولة فقط (بدون مأكولات). اسم الجهاز يُحفظ كلقطة حتى تبقى
/// الحجوزات القديمة مقروءة لو أُعيدت تسمية الجهاز لاحقًا.
class Booking {
  final int id;
  final String customerName;
  final String phone;
  final SessionResourceType resourceType;
  final int resourceId;
  final String resourceName;
  final DateTime startAt;
  final DateTime endAt;
  final BookingStatus status;
  final int? convertedCartId;
  final DateTime? reminderShownAt;
  final DateTime createdAt;

  const Booking({
    required this.id,
    required this.customerName,
    required this.phone,
    required this.resourceType,
    required this.resourceId,
    required this.resourceName,
    required this.startAt,
    required this.endAt,
    required this.status,
    required this.createdAt,
    this.convertedCartId,
    this.reminderShownAt,
  });

  Duration get duration => endAt.difference(startAt);

  String get timeRangeLabel => '${formatClock(startAt)} - ${formatClock(endAt)}';
}

/// حجز غير صالح (حقول ناقصة، نهاية قبل البداية، وقت مضى).
class BookingValidationException implements Exception {
  final String message;
  const BookingValidationException(this.message);
  @override
  String toString() => message;
}

/// تعارض مع حجز موجود على نفس الجهاز.
class BookingConflictException implements Exception {
  final Booking conflicting;
  const BookingConflictException(this.conflicting);

  String get message =>
      'يوجد حجز متعارض على "${conflicting.resourceName}": '
      '${conflicting.customerName} من ${formatClock(conflicting.startAt)} '
      'إلى ${formatClock(conflicting.endAt)} (${formatDate(conflicting.startAt)})';

  @override
  String toString() => message;
}
