import '../entities/menu_item_entity.dart';

abstract class MenuRepository {
  Stream<List<MenuItemEntity>> watchAllItems();
  Future<MenuItemEntity> addItem(MenuItemEntity item);
  Future<MenuItemEntity> updateItem(MenuItemEntity item);

  /// تعطيل بدل حذف فعلي (راجع التعليق في menu_item_entity.dart).
  Future<void> deactivateItem(int itemId);

  /// تزويد المخزون بكمية جديدة (شراء بضاعة). يزيد الكمية الحالية فقط ولا
  /// يستبدلها، لتفادي فقدان أي كمية متبقية عن طريق الخطأ.
  Future<void> restock(int itemId, int quantityToAdd);

  /// خصم كمية من المخزون عند بيع صنف. ستستخدمها ميزة "السلة" تلقائيًا عند
  /// إضافة صنف لسلة زبون. يرمي StateError إن كانت الكمية المتوفرة أقل من
  /// المطلوبة، حتى لا يُباع صنف غير متوفر فعليًا بالصالة.
  Future<void> decrementStock(int itemId, int quantityToRemove);
}
