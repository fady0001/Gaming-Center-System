import 'package:isar/isar.dart';

import '../../../sessions/domain/entities/active_session.dart';
import '../../domain/entities/cart.dart';

part 'cart_models.g.dart';

@collection
class CartModel {
  Id id = Isar.autoIncrement;

  late String customerName;
  late DateTime createdAt;
  DateTime? closedAt;

  @Enumerated(EnumType.name)
  late CartStatus status;

  int? finalTotalMinorUnits;

  /// السلال القديمة (قبل إضافة الأيام) تكون null وتُنسب لأول يوم عند إنشائه.
  @Index()
  int? dayId;
}

@collection
class CartItemModel {
  Id id = Isar.autoIncrement;

  @Index()
  late int cartId;

  late int menuItemId;
  late String name;
  late int unitPriceMinorUnits;
  late int quantity;
}

@collection
class CartPlayLineModel {
  Id id = Isar.autoIncrement;

  @Index()
  late int cartId;

  late int sessionId;
  late int resourceId;

  @Enumerated(EnumType.name)
  SessionResourceType? resourceType;
  int? playerCount;
  late String resourceName;
  int? plannedMinutes;
  late DateTime startedAt;
  int? chargeMinorUnits;
  int? billedMinutes;
}
