import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/color_palette.dart';
import '../../../../core/theme/dimensions.dart';
import '../../../../core/theme/text_styles.dart';
import '../../domain/entities/menu_item_entity.dart';
import '../cubit/menu_cubit.dart';

/// نافذة "تزويد مخزون" سريعة: تضيف كمية جديدة فوق الكمية الحالية لصنف
/// معيّن (مثال: وصلت كرتونة مشروبات جديدة). لا تستبدل الكمية، بل تضيف.
class RestockDialog extends StatefulWidget {
  final MenuItemEntity item;

  const RestockDialog({super.key, required this.item});

  static Future<void> show(BuildContext context, MenuItemEntity item) {
    return showDialog(
      context: context,
      builder: (dialogContext) => BlocProvider.value(
        value: context.read<MenuCubit>(),
        child: RestockDialog(item: item),
      ),
    );
  }

  @override
  State<RestockDialog> createState() => _RestockDialogState();
}

class _RestockDialogState extends State<RestockDialog> {
  final _quantityController = TextEditingController();
  String? _errorMessage;
  bool _isSaving = false;

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final quantity = int.tryParse(_quantityController.text.trim());
    if (quantity == null || quantity <= 0) {
      setState(() => _errorMessage = 'أدخل كمية صحيحة أكبر من صفر');
      return;
    }

    setState(() {
      _isSaving = true;
      _errorMessage = null;
    });

    try {
      await context.read<MenuCubit>().restock(widget.item.id, quantity);
      if (mounted) Navigator.of(context).pop();
    } catch (e) {
      setState(() {
        _isSaving = false;
        _errorMessage = 'تعذّر التزويد: ${e.toString()}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor =
        isDark ? ColorPalette.darkTextPrimary : ColorPalette.lightTextPrimary;
    final secondaryColor = isDark
        ? ColorPalette.darkTextSecondary
        : ColorPalette.lightTextSecondary;

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.radiusL),
      ),
      title: Text('تزويد المخزون', style: AppTextStyles.heading3(textColor)),
      content: SizedBox(
        width: 320,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${widget.item.name} — الكمية الحالية: ${widget.item.stockQuantity}',
              style: AppTextStyles.bodyMedium(secondaryColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Dimensions.spaceM),
            TextField(
              controller: _quantityController,
              autofocus: true,
              textDirection: TextDirection.ltr,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'الكمية المضافة'),
            ),
            if (_errorMessage != null) ...[
              const SizedBox(height: Dimensions.spaceS),
              Text(
                _errorMessage!,
                style: AppTextStyles.bodySmall(ColorPalette.danger),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: _isSaving ? null : () => Navigator.of(context).pop(),
          child: const Text('إلغاء'),
        ),
        ElevatedButton(
          onPressed: _isSaving ? null : _submit,
          style: ElevatedButton.styleFrom(backgroundColor: ColorPalette.primary),
          child: Text('تزويد', style: AppTextStyles.button(Colors.white)),
        ),
      ],
    );
  }
}
