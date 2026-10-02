import '../../../../core/utils/arabic_search.dart';
import '../entities/booking.dart';

/// Overlap = (Start_new < End_existing) AND (End_new > Start_existing)
/// حجزان متلاصقان (نهاية الأول = بداية الثاني) لا يتعارضان.
bool bookingsOverlap(
  DateTime newStart,
  DateTime newEnd,
  DateTime existingStart,
  DateTime existingEnd,
) {
  return newStart.isBefore(existingEnd) && newEnd.isAfter(existingStart);
}

/// حجوزات يوم معيّن (حسب وقت البداية) مع بحث باسم الزبون، مرتبة زمنيًا.
/// [day] == null يعني كل الأيام.
List<Booking> filterBookings(
  List<Booking> bookings, {
  DateTime? day,
  String query = '',
}) {
  final q = normalizeForSearch(query);
  final result = bookings.where((b) {
    if (day != null &&
        !(b.startAt.year == day.year &&
            b.startAt.month == day.month &&
            b.startAt.day == day.day)) {
      return false;
    }
    if (q.isNotEmpty && !normalizeForSearch(b.customerName).contains(q)) {
      return false;
    }
    return true;
  }).toList();
  result.sort((a, b) => a.startAt.compareTo(b.startAt));
  return result;
}

/// حجوزات قادمة دخلت نافذة التذكير (افتراضيًا قبل 60 دقيقة من البداية)،
/// لم يُعرض تذكيرها بعد، ولم ينتهِ وقتها بالكامل.
List<Booking> findBookingsDueForReminder(
  List<Booking> bookings,
  DateTime now, {
  Duration lead = const Duration(minutes: 60),
}) {
  return bookings
      .where((b) =>
          b.status == BookingStatus.scheduled &&
          b.reminderShownAt == null &&
          !now.isBefore(b.startAt.subtract(lead)) &&
          now.isBefore(b.endAt))
      .toList();
}
