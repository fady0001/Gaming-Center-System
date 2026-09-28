/// تصنيف صنف المنيو. القائمة قابلة للتوسيع بسهولة لاحقًا (يكفي إضافة قيمة
/// جديدة هنا + سطر بالـ label أدناه)، دون التأثير على أي كود آخر.
enum MenuCategory { food, coldDrinks, hotDrinks, hookah, other }

extension MenuCategoryLabel on MenuCategory {
  /// الاسم المعروض بالعربي في كل شاشات المنيو والفواتير.
  String get arabicLabel {
    switch (this) {
      case MenuCategory.food:
        return 'مأكولات';
      case MenuCategory.coldDrinks:
        return 'مشروبات باردة';
      case MenuCategory.hotDrinks:
        return 'مشروبات ساخنة';
      case MenuCategory.hookah:
        return 'أراكيل';
      case MenuCategory.other:
        return 'أخرى';
    }
  }
}
