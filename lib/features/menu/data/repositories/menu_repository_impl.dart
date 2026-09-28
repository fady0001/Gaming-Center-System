import 'package:isar/isar.dart';

import '../../domain/entities/menu_item_entity.dart';
import '../../domain/repositories/menu_repository.dart';
import '../models/menu_item_model.dart';

class MenuRepositoryImpl implements MenuRepository {
  final Isar _isar;
  MenuRepositoryImpl(this._isar);

  @override
  Stream<List<MenuItemEntity>> watchAllItems() {
    return _isar.menuItemModels
        .filter()
        .isActiveFlagEqualTo(true)
        .watch(fireImmediately: true)
        .map((models) => models.map((m) => m.toEntity()).toList());
  }

  @override
  Future<MenuItemEntity> addItem(MenuItemEntity item) async {
    final model = MenuItemModel.fromEntity(item);
    await _isar.writeTxn(() async {
      await _isar.menuItemModels.put(model);
    });
    return model.toEntity();
  }

  @override
  Future<MenuItemEntity> updateItem(MenuItemEntity item) async {
    final model = MenuItemModel.fromEntity(item);
    await _isar.writeTxn(() async {
      await _isar.menuItemModels.put(model);
    });
    return model.toEntity();
  }

  @override
  Future<void> deactivateItem(int itemId) async {
    await _isar.writeTxn(() async {
      final model = await _isar.menuItemModels.get(itemId);
      if (model == null) return;
      model.isActiveFlag = false;
      await _isar.menuItemModels.put(model);
    });
  }

  @override
  Future<void> restock(int itemId, int quantityToAdd) async {
    if (quantityToAdd <= 0) {
      throw ArgumentError('كمية التزويد يجب أن تكون أكبر من صفر');
    }
    await _isar.writeTxn(() async {
      final model = await _isar.menuItemModels.get(itemId);
      if (model == null) return;
      model.stockQuantity += quantityToAdd;
      await _isar.menuItemModels.put(model);
    });
  }

  @override
  Future<void> decrementStock(int itemId, int quantityToRemove) async {
    if (quantityToRemove <= 0) {
      throw ArgumentError('الكمية المطلوب خصمها يجب أن تكون أكبر من صفر');
    }
    await _isar.writeTxn(() async {
      final model = await _isar.menuItemModels.get(itemId);
      if (model == null) {
        throw StateError('الصنف غير موجود بالمخزون');
      }
      if (model.stockQuantity < quantityToRemove) {
        throw StateError('الكمية المتوفرة من "${model.name}" غير كافية');
      }
      model.stockQuantity -= quantityToRemove;
      await _isar.menuItemModels.put(model);
    });
  }
}
