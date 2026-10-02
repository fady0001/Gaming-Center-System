import 'dart:async';

import 'package:isar/isar.dart';

import '../../../../core/domain/entities/billing_rate.dart';
import '../../../../core/domain/value_objects/money.dart';
import '../../../days/data/work_day_store.dart';
import '../../../menu/data/models/menu_item_model.dart';
import '../../../sessions/domain/entities/active_session.dart';
import '../../../sessions/domain/repositories/session_repository.dart';
import '../../domain/entities/cart.dart';
import '../../domain/repositories/cart_repository.dart';
import '../models/cart_models.dart';

class CartRepositoryImpl implements CartRepository {
  final Isar _isar;
  final SessionRepository _sessions;

  CartRepositoryImpl(this._isar, this._sessions);

  Future<Cart> _assemble(CartModel m) async {
    final items =
        await _isar.cartItemModels.filter().cartIdEqualTo(m.id).findAll();
    final lines =
        await _isar.cartPlayLineModels.filter().cartIdEqualTo(m.id).findAll();

    return Cart(
      id: m.id,
      customerName: m.customerName,
      createdAt: m.createdAt,
      status: m.status,
      closedAt: m.closedAt,
      finalTotal: m.finalTotalMinorUnits == null
          ? null
          : Money(m.finalTotalMinorUnits!),
      dayId: m.dayId,
      items: items
          .map((i) => CartItemLine(
                id: i.id,
                cartId: i.cartId,
                menuItemId: i.menuItemId,
                name: i.name,
                unitPrice: Money(i.unitPriceMinorUnits),
                quantity: i.quantity,
              ))
          .toList(),
      playLines: lines
          .map((l) => CartPlayLine(
                id: l.id,
                cartId: l.cartId,
                sessionId: l.sessionId,
                resourceId: l.resourceId,
                resourceType: l.resourceType ?? SessionResourceType.billiardTable,
                playerCount: l.playerCount,
                resourceName: l.resourceName,
                plannedMinutes: l.plannedMinutes,
                startedAt: l.startedAt,
                finalCharge: l.chargeMinorUnits == null
                    ? null
                    : Money(l.chargeMinorUnits!),
                billedMinutes: l.billedMinutes,
              ))
          .toList(),
    );
  }

  Future<List<Cart>> _loadOpen() async {
    final models = await _isar.cartModels
        .filter()
        .statusEqualTo(CartStatus.open)
        .sortByCreatedAtDesc()
        .findAll();
    final result = <Cart>[];
    for (final m in models) {
      result.add(await _assemble(m));
    }
    return result;
  }

  @override
  Future<List<Cart>> getOpenCarts() => _loadOpen();

  @override
  Future<List<Cart>> getCartsByDay(int dayId) async {
    final models = await _isar.cartModels
        .filter()
        .dayIdEqualTo(dayId)
        .sortByCreatedAtDesc()
        .findAll();
    final result = <Cart>[];
    for (final m in models) {
      result.add(await _assemble(m));
    }
    return result;
  }

  @override
  Stream<List<Cart>> watchOpenCarts() {
    late StreamController<List<Cart>> controller;
    final subscriptions = <StreamSubscription<void>>[];
    var sequence = 0;

    Future<void> emitCurrent() async {
      final mine = ++sequence;
      try {
        final carts = await _loadOpen();
        if (!controller.isClosed && mine == sequence) controller.add(carts);
      } catch (e, s) {
        if (!controller.isClosed) controller.addError(e, s);
      }
    }

    controller = StreamController<List<Cart>>(
      onListen: () {
        subscriptions.add(_isar.cartModels.watchLazy().listen((_) => emitCurrent()));
        subscriptions
            .add(_isar.cartItemModels.watchLazy().listen((_) => emitCurrent()));
        subscriptions.add(
            _isar.cartPlayLineModels.watchLazy().listen((_) => emitCurrent()));
        emitCurrent();
      },
      onCancel: () async {
        for (final s in subscriptions) {
          await s.cancel();
        }
      },
    );
    return controller.stream;
  }

  @override
  Future<Cart> createCart(String customerName) async {
    final name = customerName.trim();
    if (name.isEmpty) {
      throw ArgumentError('اسم الزبون مطلوب');
    }
    final model = CartModel()
      ..customerName = name
      ..createdAt = DateTime.now()
      ..status = CartStatus.open;
    await _isar.writeTxn(() async {
      final day = await WorkDayStore.ensureOpenDay(_isar);
      model.dayId = day.id;
      await _isar.cartModels.put(model);
    });
    return _assemble(model);
  }

  @override
  Future<void> addItem({
    required int cartId,
    required int menuItemId,
    required int quantity,
  }) async {
    if (quantity <= 0) {
      throw ArgumentError('الكمية يجب أن تكون أكبر من صفر');
    }

   
    await _isar.writeTxn(() async {
      final cart = await _isar.cartModels.get(cartId);
      if (cart == null || cart.status != CartStatus.open) {
        throw StateError('السلة مغلقة أو غير موجودة');
      }

      final menu = await _isar.menuItemModels.get(menuItemId);
      if (menu == null || !menu.isActiveFlag) {
        throw StateError('الصنف غير متوفر بالمنيو');
      }
      if (menu.stockQuantity < quantity) {
        throw StateError(
            'الكمية المتوفرة من "${menu.name}" غير كافية (المتوفر: ${menu.stockQuantity})');
      }

      menu.stockQuantity -= quantity;
      await _isar.menuItemModels.put(menu);

 
      final existing = await _isar.cartItemModels
          .filter()
          .cartIdEqualTo(cartId)
          .menuItemIdEqualTo(menuItemId)
          .unitPriceMinorUnitsEqualTo(menu.priceMinorUnits)
          .findFirst();

      if (existing != null) {
        existing.quantity += quantity;
        await _isar.cartItemModels.put(existing);
      } else {
        await _isar.cartItemModels.put(CartItemModel()
          ..cartId = cartId
          ..menuItemId = menuItemId
          ..name = menu.name
          ..unitPriceMinorUnits = menu.priceMinorUnits
          ..quantity = quantity);
      }
    });
  }

  @override
  Future<void> removeItem(int itemLineId) async {
    await _isar.writeTxn(() async {
      final line = await _isar.cartItemModels.get(itemLineId);
      if (line == null) return;

      final cart = await _isar.cartModels.get(line.cartId);
      if (cart == null || cart.status != CartStatus.open) {
        throw StateError('لا يمكن تعديل سلة مغلقة');
      }

      final menu = await _isar.menuItemModels.get(line.menuItemId);
      if (menu != null) {
        menu.stockQuantity += line.quantity;
        await _isar.menuItemModels.put(menu);
      }
      await _isar.cartItemModels.delete(itemLineId);
    });
  }

  @override
  Future<void> addPlayLine({
    required int cartId,
    required SessionResourceType resourceType,
    required int resourceId,
    required String resourceName,
    required BillingRate rate,
    int? playerCount,
    int? plannedMinutes,
  }) async {
    if (plannedMinutes != null && plannedMinutes <= 0) {
      throw ArgumentError('المدة المحددة يجب أن تكون أكبر من صفر');
    }
    final cart = await _isar.cartModels.get(cartId);
    if (cart == null || cart.status != CartStatus.open) {
      throw StateError('السلة مغلقة أو غير موجودة');
    }

    final session = await _sessions.startSession(
      resourceType: resourceType,
      resourceId: resourceId,
      rate: rate,
    );

    try {
      await _isar.writeTxn(() async {
        await _isar.cartPlayLineModels.put(CartPlayLineModel()
          ..cartId = cartId
          ..sessionId = session.id
          ..resourceId = resourceId
          ..resourceType = resourceType
          ..playerCount = playerCount
          ..resourceName = resourceName
          ..plannedMinutes = plannedMinutes
          ..startedAt = session.startTime);
      });
    } catch (_) {
  
      try {
        await _sessions.closeSession(
            sessionId: session.id, endTime: DateTime.now());
      } catch (_) {}
      rethrow;
    }
  }

  @override
  Future<List<Cart>> getClosedCarts({int limit = 200}) async {
    final models = await _isar.cartModels
        .filter()
        .statusEqualTo(CartStatus.closed)
        .sortByClosedAtDesc()
        .limit(limit)
        .findAll();
    final result = <Cart>[];
    for (final m in models) {
      result.add(await _assemble(m));
    }
    return result;
  }

  @override
  Future<List<Cart>> getClosedCartsBetween(DateTime start, DateTime end) async {
    final models = await _isar.cartModels
        .filter()
        .statusEqualTo(CartStatus.closed)
        .and()
        .closedAtBetween(start, end, includeLower: true, includeUpper: false)
        .sortByClosedAtDesc()
        .findAll();
    final result = <Cart>[];
    for (final m in models) {
      result.add(await _assemble(m));
    }
    return result;
  }

  @override
  Future<Cart> checkout(int cartId) async {
    final cart = await _isar.cartModels.get(cartId);
    if (cart == null || cart.status != CartStatus.open) {
      throw StateError('السلة مغلقة أو غير موجودة');
    }

    final now = DateTime.now();
    final pending = await _isar.cartPlayLineModels
        .filter()
        .cartIdEqualTo(cartId)
        .chargeMinorUnitsIsNull()
        .findAll();

 
    for (final line in pending) {
      final summary = await _sessions.closeSession(
        sessionId: line.sessionId,
        endTime: now,
      );
      line.chargeMinorUnits = summary.timeCharge.minorUnits;
      line.billedMinutes = summary.billedDuration.inMinutes;
      await _isar.writeTxn(() async {
        await _isar.cartPlayLineModels.put(line);
      });
    }

    final lines =
        await _isar.cartPlayLineModels.filter().cartIdEqualTo(cartId).findAll();
    final items =
        await _isar.cartItemModels.filter().cartIdEqualTo(cartId).findAll();

    var total = 0;
    for (final l in lines) {
      total += l.chargeMinorUnits ?? 0;
    }
    for (final i in items) {
      total += i.unitPriceMinorUnits * i.quantity;
    }

    cart
      ..status = CartStatus.closed
      ..closedAt = now
      ..finalTotalMinorUnits = total;
    await _isar.writeTxn(() async {
      await _isar.cartModels.put(cart);
    });

    return _assemble(cart);
  }
}
