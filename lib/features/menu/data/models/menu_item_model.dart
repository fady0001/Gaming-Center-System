import 'package:isar/isar.dart';

import '../../../../core/domain/value_objects/money.dart';
import '../../domain/entities/menu_category.dart';
import '../../domain/entities/menu_item_entity.dart';

part 'menu_item_model.g.dart';

/// يحتاج توليد كود بعد أي تعديل على هذا الملف:
/// dart run build_runner build --delete-conflicting-outputs
@collection
class MenuItemModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, caseSensitive: false)
  late String name;

  @Enumerated(EnumType.name)
  late MenuCategory category;

  late int priceMinorUnits;
  late int stockQuantity;

  @Index()
  bool isActiveFlag = true;

  MenuItemEntity toEntity() {
    return MenuItemEntity(
      id: id,
      name: name,
      category: category,
      price: Money(priceMinorUnits),
      stockQuantity: stockQuantity,
      isActive: isActiveFlag,
    );
  }

  static MenuItemModel fromEntity(MenuItemEntity entity) {
    return MenuItemModel()
      ..id = entity.id == 0 ? Isar.autoIncrement : entity.id
      ..name = entity.name
      ..category = entity.category
      ..priceMinorUnits = entity.price.minorUnits
      ..stockQuantity = entity.stockQuantity
      ..isActiveFlag = entity.isActive;
  }
}
