import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/value_objects/money.dart';
import '../../../../core/theme/color_palette.dart';
import '../../../../core/theme/dimensions.dart';
import '../../../../core/theme/text_styles.dart';
import '../../domain/entities/menu_category.dart';
import '../../domain/entities/menu_item_entity.dart';
import '../cubit/menu_cubit.dart';

/// نافذة إضافة صنف جديد أو تعديل صنف موجود بالمنيو.
/// [existingItem] فارغ يعني "إضافة صنف جديد"، وممرَّر يعني "تعديل".
class MenuItemFormDialog extends StatefulWidget {
  final MenuItemEntity? existingItem;

  const MenuItemFormDialog({super.key, this.existingItem});

  static Future<void> show(BuildContext context, {MenuItemEntity? item}) {
    return showDialog(
      context: context,
      builder: (dialogContext) => BlocProvider.value(
        value: context.read<MenuCubit>(),
        child: MenuItemFormDialog(existingItem: item),
      ),
    );
  }

  @override
  State<MenuItemFormDialog> createState() => _MenuItemFormDialogState();
}

class _MenuItemFormDialogState extends State<MenuItemFormDialog> {
  late final TextEditingController _nameController;
  late final TextEditingController _priceController;
  late final TextEditingController _stockController;
  late MenuCategory _selectedCategory;
  String? _errorMessage;
  bool _isSaving = false;

  bool get _isEditing => widget.existingItem != null;

  @override
  void initState() {
    super.initState();
    final item = widget.existingItem;
    _nameController = TextEditingController(text: item?.name ?? '');
    _priceController =
        TextEditingController(text: item?.price.toDisplayString() ?? '');
    _stockController =
        TextEditingController(text: (item?.stockQuantity ?? 0).toString());
    _selectedCategory = item?.category ?? MenuCategory.food;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _stockController.dispose();
    super.dispose();
  }

  /// يحوّل نص السعر (مثال: "150.50") إلى Money بأعداد صحيحة فقط، دون أي
  /// عملية على double في أي خطوة (نفس مبدأ core/domain/value_objects/money).
  Money? _parsePrice(String input) {
    final trimmed = input.trim();
    if (trimmed.isEmpty) return null;
    final parts = trimmed.split('.');
    final major = int.tryParse(parts[0].isEmpty ? '0' : parts[0]);
    if (major == null || major < 0) return null;

    var minor = 0;
    if (parts.length > 1) {
      var minorStr = parts[1];
      if (minorStr.length > 2) minorStr = minorStr.substring(0, 2);
      minorStr = minorStr.padRight(2, '0');
      final parsedMinor = int.tryParse(minorStr);
      if (parsedMinor == null || parsedMinor < 0) return null;
      minor = parsedMinor;
    }
    return Money.fromMajorAndMinor(major, minor);
  }

  Future<void> _submit() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      setState(() => _errorMessage = 'الرجاء إدخال اسم الصنف');
      return;
    }

    final price = _parsePrice(_priceController.text);
    if (price == null) {
      setState(() => _errorMessage = 'سعر غير صالح');
      return;
    }

    final stock = int.tryParse(_stockController.text.trim());
    if (stock == null || stock < 0) {
      setState(() => _errorMessage = 'كمية المخزون يجب أن تكون رقمًا صحيحًا');
      return;
    }

    setState(() {
      _isSaving = true;
      _errorMessage = null;
    });

    try {
      final cubit = context.read<MenuCubit>();
      if (_isEditing) {
        await cubit.updateItem(widget.existingItem!.copyWith(
          name: name,
          category: _selectedCategory,
          price: price,
          stockQuantity: stock,
        ));
      } else {
        await cubit.addItem(MenuItemEntity(
          id: 0,
          name: name,
          category: _selectedCategory,
          price: price,
          stockQuantity: stock,
        ));
      }
      if (mounted) Navigator.of(context).pop();
    } catch (e) {
      setState(() {
        _isSaving = false;
        _errorMessage = 'تعذّر الحفظ: ${e.toString()}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor =
        isDark ? ColorPalette.darkTextPrimary : ColorPalette.lightTextPrimary;

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.radiusL),
      ),
      title: Text(
        _isEditing ? 'تعديل صنف' : 'إضافة صنف جديد',
        style: AppTextStyles.heading3(textColor),
      ),
      content: SizedBox(
        width: 360,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              autofocus: true,
              decoration: const InputDecoration(labelText: 'اسم الصنف'),
            ),
            const SizedBox(height: Dimensions.spaceM),
            DropdownButtonFormField<MenuCategory>(
              initialValue: _selectedCategory,
              decoration: const InputDecoration(labelText: 'التصنيف'),
              items: MenuCategory.values
                  .map((category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.arabicLabel),
                      ))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() => _selectedCategory = value);
                }
              },
            ),
            const SizedBox(height: Dimensions.spaceM),
            TextField(
              controller: _priceController,
              textDirection: TextDirection.ltr,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'السعر',
                prefixIcon: Icon(Icons.payments_outlined),
              ),
            ),
            const SizedBox(height: Dimensions.spaceM),
            TextField(
              controller: _stockController,
              textDirection: TextDirection.ltr,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'الكمية المتوفرة بالمخزون',
                prefixIcon: Icon(Icons.inventory_2_outlined),
              ),
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
          child: _isSaving
              ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(
                      strokeWidth: 2, color: Colors.white),
                )
              : Text('حفظ', style: AppTextStyles.button(Colors.white)),
        ),
      ],
    );
  }
}
