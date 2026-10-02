import 'package:isar/isar.dart';

import '../../../sessions/domain/entities/active_session.dart';
import '../../domain/entities/booking.dart';

part 'booking_model.g.dart';

@collection
class BookingModel {
  Id id = Isar.autoIncrement;

  late String customerName;
  late String phone;

  @Enumerated(EnumType.name)
  late SessionResourceType resourceType;

  @Index()
  late int resourceId;

  late String resourceName;

  @Index()
  late DateTime startAt;

  late DateTime endAt;

  @Enumerated(EnumType.name)
  late BookingStatus status;

  int? convertedCartId;
  DateTime? reminderShownAt;
  late DateTime createdAt;

  Booking toEntity() => Booking(
        id: id,
        customerName: customerName,
        phone: phone,
        resourceType: resourceType,
        resourceId: resourceId,
        resourceName: resourceName,
        startAt: startAt,
        endAt: endAt,
        status: status,
        convertedCartId: convertedCartId,
        reminderShownAt: reminderShownAt,
        createdAt: createdAt,
      );
}
