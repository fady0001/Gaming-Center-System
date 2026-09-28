import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/entities/billing_rate.dart';
import '../../../../core/domain/value_objects/money_parser.dart';
import '../../../../core/theme/color_palette.dart';
import '../../../../core/theme/dimensions.dart';
import '../../../tables/domain/entities/table_entity.dart';
import '../../../tables/presentation/cubit/tables_cubit.dart';
import 'rate_fields.dart';

/// إضافة/تعديل طاولة (المدير فقط): الاسم، النوع، سعر الساعة، وقواعد التقريب.
class TableFormDialog extends StatefulWidget {
  final TableEntity? existing;
  const TableFormDialog({super.key, this.existing});

  static Future<void> show(BuildContext context, {TableEntity? table}) {
    return showDialog(
      context: context,
      builder: (_) => BlocProvider.value(
        value: context.read<TablesCubit>(),
        child: TableFormDialog(existing: table),
      ),
    );
  }

  @override
  State<TableFormDialog> createState() => _TableFormDialogState();
}

class _TableFormDialogState extends State<TableFormDialog> {
  late final TextEditingController _name;
  late final TextEditingController _price;
  late final TextEditingController _minMinutes;
  late final TextEditingController _rounding;
  late TableType _type;
  String? _error;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final t = widget.existing;
    _name = TextEditingController(text: t?.name ?? '');
    _price = TextEditingController(text: t?.defaultRate.ratePerHour.toDisplayString() ?? '');
    _minMinutes = TextEditingController(text: '${t?.defaultRate.minimumChargeMinutes ?? 0}');
    _rounding = TextEditingController(text: '${t?.defaultRate.roundingIncrementMinutes ?? 1}');
    _type = t?.type ?? TableType.billiards;
  }

  @override
  void dispose() {
    _name.dispose();
    _price.dispose();
    _minMinutes.dispose();
    _rounding.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final name = _name.text.trim();
    final price = parseMoney(_price.text);
    final minMinutes = int.tryParse(_minMinutes.text.trim());
    final rounding = int.tryParse(_rounding.text.trim());

    String? error;
    if (name.isEmpty) {
      error = 'أدخل اسم الطاولة';
    } else if (price == null) {
      error = 'سعر الساعة غير صالح';
    } else if (minMinutes == null || minMinutes < 0) {
      error = 'أقل مدة محتسبة غير صالحة';
    } else if (rounding == null || rounding < 1) {
      error = 'وحدة التقريب يجب أن تكون 1 أو أكثر';
    }
    if (error != null) {
      setState(() => _error = error);
      return;
    }

    setState(() {
      _saving = true;
      _error = null;
    });
    try {
      final rate = BillingRate(
        ratePerHour: price!,
        minimumChargeMinutes: minMinutes!,
        roundingIncrementMinutes: rounding!,
      );
      final cubit = context.read<TablesCubit>();
      if (widget.existing != null) {
        await cubit.updateTable(widget.existing!
            .copyWith(name: name, type: _type, defaultRate: rate));
      } else {
        await cubit.addTable(
            TableEntity(id: 0, name: name, type: _type, defaultRate: rate));
      }
      if (mounted) Navigator.of(context).pop();
    } catch (e) {
      setState(() {
        _saving = false;
        _error = 'تعذّر الحفظ (قد يكون الاسم مكررًا): $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.existing == null ? 'إضافة طاولة' : 'تعديل طاولة'),
      content: SizedBox(
        width: 360,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _name,
                autofocus: true,
                decoration: const InputDecoration(labelText: 'اسم الطاولة'),
              ),
              const SizedBox(height: Dimensions.spaceM),
              DropdownButtonFormField<TableType>(
                initialValue: _type,
                decoration: const InputDecoration(labelText: 'النوع'),
                items: TableType.values
                    .map((t) => DropdownMenuItem(value: t, child: Text(t.arabicLabel)))
                    .toList(),
                onChanged: (v) => setState(() => _type = v ?? _type),
              ),
              const SizedBox(height: Dimensions.spaceM),
              adminNumberField(
                  controller: _price,
                  label: 'سعر الساعة',
                  decimal: true,
                  icon: Icons.payments_outlined),
              const SizedBox(height: Dimensions.spaceM),
              adminNumberField(controller: _minMinutes, label: 'أقل مدة محتسبة (دقائق، 0 = بدون)'),
              const SizedBox(height: Dimensions.spaceM),
              adminNumberField(controller: _rounding, label: 'التقريب لأقرب (دقائق، 1 = بدون تقريب)'),
              if (_error != null) ...[
                const SizedBox(height: Dimensions.spaceS),
                Text(_error!, style: const TextStyle(color: ColorPalette.danger)),
              ],
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _saving ? null : () => Navigator.of(context).pop(),
          child: const Text('إلغاء'),
        ),
        ElevatedButton(onPressed: _saving ? null : _save, child: const Text('حفظ')),
      ],
    );
  }
}
