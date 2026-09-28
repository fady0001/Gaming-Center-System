import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/entities/billing_rate.dart';
import '../../../sessions/domain/entities/active_session.dart';
import '../../domain/entities/cart.dart';
import '../../domain/repositories/cart_repository.dart';

class CartsState {
  final List<Cart> carts;
  final bool isLoading;

  const CartsState({this.carts = const [], this.isLoading = true});

  Cart? cartById(int id) {
    for (final cart in carts) {
      if (cart.id == id) return cart;
    }
    return null;
  }
}

class CartsCubit extends Cubit<CartsState> {
  final CartRepository _repository;
  StreamSubscription<List<Cart>>? _subscription;

  CartsCubit(this._repository) : super(const CartsState()) {
    _subscription = _repository.watchOpenCarts().listen((carts) {
      emit(CartsState(carts: carts, isLoading: false));
    });
  }

  Future<Cart> createCart(String customerName) =>
      _repository.createCart(customerName);

  Future<void> addItem(int cartId, int menuItemId, int quantity) =>
      _repository.addItem(
          cartId: cartId, menuItemId: menuItemId, quantity: quantity);

  Future<void> removeItem(int itemLineId) =>
      _repository.removeItem(itemLineId);

  Future<void> addPlayLine({
    required int cartId,
    required SessionResourceType resourceType,
    required int resourceId,
    required String resourceName,
    required BillingRate rate,
    int? playerCount,
    int? plannedMinutes,
  }) =>
      _repository.addPlayLine(
        cartId: cartId,
        resourceType: resourceType,
        resourceId: resourceId,
        resourceName: resourceName,
        rate: rate,
        playerCount: playerCount,
        plannedMinutes: plannedMinutes,
      );

  Future<Cart> checkout(int cartId) => _repository.checkout(cartId);

  Future<List<Cart>> closedCarts({int limit = 200}) =>
      _repository.getClosedCarts(limit: limit);

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
