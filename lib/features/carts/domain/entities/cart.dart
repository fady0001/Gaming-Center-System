import '../../../../core/domain/value_objects/money.dart';
import '../../../sessions/domain/entities/active_session.dart';

enum CartStatus { open, closed }

class CartItemLine {
  final int id;
  final int cartId;
  final int menuItemId;
  final String name;
  final Money unitPrice;
  final int quantity;

  const CartItemLine({
    required this.id,
    required this.cartId,
    required this.menuItemId,
    required this.name,
    required this.unitPrice,
    required this.quantity,
  });

  Money get total => unitPrice * quantity;
}


class CartPlayLine {
  final int id;
  final int cartId;
  final int sessionId;
  final int resourceId;
  final SessionResourceType resourceType;
  final String resourceName;

  final int? playerCount;
  final int? plannedMinutes;
  final DateTime startedAt;
  final Money? finalCharge;
  final int? billedMinutes;

  const CartPlayLine({
    required this.id,
    required this.cartId,
    required this.sessionId,
    required this.resourceId,
    required this.resourceName,
    required this.startedAt,
    this.resourceType = SessionResourceType.billiardTable,
    this.playerCount,
    this.plannedMinutes,
    this.finalCharge,
    this.billedMinutes,
  });

  bool get isOpenTime => plannedMinutes == null;
  bool get isSettled => finalCharge != null;
}

class Cart {
  final int id;
  final String customerName;
  final DateTime createdAt;
  final CartStatus status;
  final DateTime? closedAt;

  final Money? finalTotal;

  /// اليوم (WorkDay) الذي أُنشئت فيه السلة.
  final int? dayId;

  final List<CartItemLine> items;
  final List<CartPlayLine> playLines;

  const Cart({
    required this.id,
    required this.customerName,
    required this.createdAt,
    required this.status,
    this.closedAt,
    this.finalTotal,
    this.dayId,
    this.items = const [],
    this.playLines = const [],
  });

  bool get isOpen => status == CartStatus.open;

  Money get itemsTotal =>
      items.fold(const Money.zero(), (sum, line) => sum + line.total);
}
