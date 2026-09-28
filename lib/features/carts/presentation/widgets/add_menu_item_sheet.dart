import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/dimensions.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../menu/domain/entities/menu_category.dart';
import '../../../menu/domain/entities/menu_item_entity.dart';
import '../../../menu/presentation/cubit/menu_cubit.dart';
import '../cubit/carts_cubit.dart';

/// اختيار صنف من المنيو (المتوفر فقط) وكمية، وإضافته لسلة الزبون.
/// الخصم من المخزون يتم تلقائيًا داخل الـ repository.
class AddMenuItemSheet extends StatefulWidget {
  final int cartId;
  const AddMenuItemSheet({super.key, required this.cartId});

  static Future<void> show(BuildContext context, int cartId) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => MultiBlocProvider(
        providers: [
          BlocProvider.value(value: context.read<CartsCubit>()),
          BlocProvider.value(value: context.read<MenuCubit>()),
        ],
        child: AddMenuItemSheet(cartId: cartId),
      ),
    );
  }

  @override
  State<AddMenuItemSheet> createState() => _AddMenuItemSheetState();
}

class _AddMenuItemSheetState extends State<AddMenuItemSheet> {
  String? _error;

  Future<void> _pick(MenuItemEntity item) async {
    final quantity = await _askQuantity(item);
    if (quantity == null || !mounted) return;
    try {
      await context.read<CartsCubit>().addItem(widget.cartId, item.id, quantity);
      if (mounted) setState(() => _error = null);
    } catch (e) {
      if (mounted) setState(() => _error = e.toString());
    }
  }

  Future<int?> _askQuantity(MenuItemEntity item) {
    var quantity = 1;
    return showDialog<int>(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: Text(item.name),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: quantity > 1
                    ? () => setDialogState(() => quantity--)
                    : null,
                icon: const Icon(Icons.remove_circle_outline),
              ),
              Text('$quantity', style: AppTextStyles.heading2(Theme.of(context).colorScheme.onSurface)),
              IconButton(
                onPressed: quantity < item.stockQuantity
                    ? () => setDialogState(() => quantity++)
                    : null,
                icon: const Icon(Icons.add_circle_outline),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('إلغاء'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(dialogContext).pop(quantity),
              child: const Text('إضافة'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onSurface;
    final items = context
        .watch<MenuCubit>()
        .state
        .items
        .where((i) => !i.isOutOfStock)
        .toList();

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.7,
      builder: (context, scrollController) => Padding(
        padding: const EdgeInsets.all(Dimensions.spaceL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('إضافة من المنيو', style: AppTextStyles.heading2(textColor)),
            if (_error != null) ...[
              const SizedBox(height: Dimensions.spaceS),
              Text(_error!, style: const TextStyle(color: Colors.red)),
            ],
            const SizedBox(height: Dimensions.spaceS),
            Expanded(
              child: items.isEmpty
                  ? const Center(child: Text('لا توجد أصناف متوفرة بالمنيو.'))
                  : ListView(
                      controller: scrollController,
                      children: [
                        for (final category in MenuCategory.values)
                          ..._section(category, items),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _section(MenuCategory category, List<MenuItemEntity> all) {
    final items = all.where((i) => i.category == category).toList();
    if (items.isEmpty) return const [];
    return [
      Padding(
        padding: const EdgeInsets.only(top: Dimensions.spaceS),
        child: Text(category.arabicLabel,
            style: Theme.of(context).textTheme.titleSmall),
      ),
      for (final item in items)
        ListTile(
          title: Text(item.name),
          subtitle: Text('المتوفر: ${item.stockQuantity}'),
          trailing: Text(item.price.toDisplayString()),
          onTap: () => _pick(item),
        ),
    ];
  }
}
