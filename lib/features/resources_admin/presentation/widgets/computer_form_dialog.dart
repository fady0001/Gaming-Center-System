import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/value_objects/money_parser.dart';
import '../../../../core/theme/color_palette.dart';
import '../../../../core/theme/dimensions.dart';
import '../../../computers/domain/entities/computer_device.dart';
import '../../../computers/presentation/cubit/computers_cubit.dart';
import 'rate_fields.dart';

/// إضافة/تعديل جهاز كمبيوتر: الاسم + سعر الساعة + قواعد التقريب.
class ComputerFormDialog extends StatefulWidget {
  final ComputerDevice? existing;
  const ComputerFormDialog({super.key, this.existing});

  static Future<void> show(BuildContext context, {ComputerDevice? device}) {
    return showDialog(
      context: context,
      builder: (_) => BlocProvider.value(
        value: context.read<ComputersCubit>(),
        child: ComputerFormDialog(existing: device),
      ),
    );
  }

  @override
  State<ComputerFormDialog> createState() => _ComputerFormDialogState();
}

class _ComputerFormDialogState extends State<ComputerFormDialog> {
  late final TextEditingController _name;
  late final TextEditingController _price;
  late final TextEditingController _minMinutes;
  late final TextEditingController _rounding;
  String? _error;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final d = widget.existing;
    _name = TextEditingController(text: d?.name ?? '');
    _price = TextEditingController(text: d?.hourlyRate.toDisplayString() ?? '');
    _minMinutes = TextEditingController(text: '${d?.minimumChargeMinutes ?? 0}');
    _rounding = TextEditingController(text: '${d?.roundingIncrementMinutes ?? 1}');
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
      error = 'أدخل اسم الجهاز';
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
      final cubit = context.read<ComputersCubit>();
      if (widget.existing != null) {
        await cubit.updateDevice(widget.existing!.copyWith(
          name: name,
          hourlyRate: price,
          minimumChargeMinutes: minMinutes,
          roundingIncrementMinutes: rounding,
        ));
      } else {
        await cubit.addDevice(ComputerDevice(
          id: 0,
          name: name,
          hourlyRate: price!,
          minimumChargeMinutes: minMinutes!,
          roundingIncrementMinutes: rounding!,
        ));
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
      title: Text(widget.existing == null ? 'إضافة كمبيوتر' : 'تعديل كمبيوتر'),
      content: SizedBox(
        width: 360,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _name,
                autofocus: true,
                decoration: const InputDecoration(labelText: 'اسم الجهاز (مثال: PC 1)'),
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
