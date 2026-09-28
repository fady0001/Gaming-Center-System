import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/color_palette.dart';
import '../../../../core/theme/dimensions.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../auth/presentation/cubit/auth_cubit.dart';
import '../../domain/entities/menu_item_entity.dart';
import '../cubit/menu_cubit.dart';
import 'menu_item_form_dialog.dart';
import 'restock_dialog.dart';

/// بطاقة صنف واحد بالمنيو. أي زائر يرى السعر والكمية المتوفرة، لكن أزرار
/// التعديل/التزويد/الإخفاء تظهر للمدير فقط (نفس الصنف سيُستخدم لاحقًا من
/// ميزة السلة لإضافته لسلة زبون، بغض النظر عن الدور).
class MenuItemCard extends StatelessWidget {
  final MenuItemEntity item;

  const MenuItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isManager = context.watch<AuthCubit>().state.isManager;
    final surfaceColor =
        isDark ? ColorPalette.darkSurface : ColorPalette.lightSurface;
    final textColor =
        isDark ? ColorPalette.darkTextPrimary : ColorPalette.lightTextPrimary;
    final secondaryColor = isDark
        ? ColorPalette.darkTextSecondary
        : ColorPalette.lightTextSecondary;

    final stockColor = item.isOutOfStock
        ? ColorPalette.danger
        : (item.stockQuantity <= 5
            ? ColorPalette.warning
            : ColorPalette.success);

    return Container(
      padding: const EdgeInsets.all(Dimensions.spaceM),
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(Dimensions.radiusM),
        border: Border.all(
          color: isDark ? ColorPalette.darkBorder : ColorPalette.lightBorder,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name, style: AppTextStyles.heading3(textColor)),
                const SizedBox(height: Dimensions.spaceXXS),
                Text(
                  item.price.toDisplayString(),
                  style: AppTextStyles.priceDisplay(ColorPalette.primary),
                ),
                const SizedBox(height: Dimensions.spaceXXS),
                Row(
                  children: [
                    Icon(Icons.inventory_2_outlined,
                        size: Dimensions.iconS, color: stockColor),
                    const SizedBox(width: Dimensions.spaceXXS),
                    Text(
                      item.isOutOfStock
                          ? 'نفدت الكمية'
                          : 'المتوفر: ${item.stockQuantity}',
                      style: AppTextStyles.bodySmall(stockColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (isManager)
            PopupMenuButton<String>(
              icon: Icon(Icons.more_vert, color: secondaryColor),
              onSelected: (action) {
                switch (action) {
                  case 'edit':
                    MenuItemFormDialog.show(context, item: item);
                    break;
                  case 'restock':
                    RestockDialog.show(context, item);
                    break;
                  case 'deactivate':
                    _confirmDeactivate(context);
                    break;
                }
              },
              itemBuilder: (context) => const [
                PopupMenuItem(value: 'edit', child: Text('تعديل')),
                PopupMenuItem(value: 'restock', child: Text('تزويد المخزون')),
                PopupMenuItem(
                    value: 'deactivate', child: Text('إخفاء من المنيو')),
              ],
            ),
        ],
      ),
    );
  }

  void _confirmDeactivate(BuildContext context) {
    // نأخذ المرجع قبل فتح الحوار حتى يبقى صالحًا داخل onPressed لاحقًا.
    final menuCubit = context.read<MenuCubit>();
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('إخفاء الصنف'),
        content: Text('هل تريد إخفاء "${item.name}" من المنيو؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('إلغاء'),
          ),
          ElevatedButton(
            style:
                ElevatedButton.styleFrom(backgroundColor: ColorPalette.danger),
            onPressed: () {
              Navigator.of(dialogContext).pop();
              menuCubit.deactivateItem(item.id);
            },
            child: const Text('إخفاء'),
          ),
        ],
      ),
    );
  }
}
