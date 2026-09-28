import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/menu_category.dart';
import '../../domain/entities/menu_item_entity.dart';
import '../../domain/repositories/menu_repository.dart';

class MenuState {
  final List<MenuItemEntity> items;
  final bool isLoading;

  const MenuState({this.items = const [], this.isLoading = true});

  MenuState copyWith({List<MenuItemEntity>? items, bool? isLoading}) {
    return MenuState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  List<MenuItemEntity> byCategory(MenuCategory category) =>
      items.where((item) => item.category == category).toList();
}

class MenuCubit extends Cubit<MenuState> {
  final MenuRepository _repository;
  StreamSubscription<List<MenuItemEntity>>? _subscription;

  MenuCubit(this._repository) : super(const MenuState()) {
    _subscription = _repository.watchAllItems().listen((items) {
      emit(state.copyWith(items: items, isLoading: false));
    });
  }

  Future<MenuItemEntity> addItem(MenuItemEntity item) =>
      _repository.addItem(item);

  Future<MenuItemEntity> updateItem(MenuItemEntity item) =>
      _repository.updateItem(item);

  Future<void> deactivateItem(int itemId) =>
      _repository.deactivateItem(itemId);

  Future<void> restock(int itemId, int quantityToAdd) =>
      _repository.restock(itemId, quantityToAdd);

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
