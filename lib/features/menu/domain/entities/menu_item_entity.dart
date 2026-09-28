import '../../../../core/domain/value_objects/money.dart';
import 'menu_category.dart';

/// صنف واحد بالمنيو (أكلة، مشروب، أركيلة...)، مرتبط مباشرة بكمية المخزون
/// الحالية له داخل نفس الكيان - لا يوجد "مخزون" منفصل عن "منيو" في هذا
/// التطبيق، فكل صنف يُباع هو بالضرورة صنف مخزون (قرار مقصود لتبسيط
/// المرحلة الأولى بدل نمذجة مخزون عام منفصل عن المبيعات).
///
/// السعر ثابت لكل صنف (بدون أحجام/أنواع متعددة الأسعار لنفس الصنف). إن
/// احتجت لاحقًا أسعارًا مختلفة (مثال: أركيلة عادي/معسل مستورد)، الأبسط هو
/// إضافتها كصنفين منفصلين بالمنيو بدل تعقيد نموذج صنف واحد بعدة أسعار.
class MenuItemEntity {
  final int id;
  final String name;
  final MenuCategory category;
  final Money price;
  final int stockQuantity;

  /// تعطيل بدل حذف فعلي: نفس منطق TableEntity - صنف قد يُسحب من المنيو،
  /// لكن حذفه فعليًا من قاعدة البيانات سيكسر أي طلب/فاتورة قديمة تشير إليه
  /// لاحقًا عند بناء ميزة السلة والفواتير.
  final bool isActive;

  const MenuItemEntity({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    this.stockQuantity = 0,
    this.isActive = true,
  });

  bool get isOutOfStock => stockQuantity <= 0;

  MenuItemEntity copyWith({
    String? name,
    MenuCategory? category,
    Money? price,
    int? stockQuantity,
    bool? isActive,
  }) {
    return MenuItemEntity(
      id: id,
      name: name ?? this.name,
      category: category ?? this.category,
      price: price ?? this.price,
      stockQuantity: stockQuantity ?? this.stockQuantity,
      isActive: isActive ?? this.isActive,
    );
  }
}
