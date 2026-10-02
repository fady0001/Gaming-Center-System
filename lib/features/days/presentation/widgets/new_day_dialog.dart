import 'package:flutter/material.dart';

import '../../../carts/domain/entities/cart.dart';

/// حوار تأكيد على خطوتين لمنع الضغط بالخطأ على "إنشاء يوم جديد".
/// يعيد true فقط إذا أكّد المستخدم الخطوتين.
Future<bool> confirmNewDay(
  BuildContext context, {
  required String currentDayLabel,
  required List<Cart> openCarts,
}) async {
  final result = await showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (_) => _NewDayDialog(
      currentDayLabel: currentDayLabel,
      openCarts: openCarts,
    ),
  );
  return result ?? false;
}

class _NewDayDialog extends StatefulWidget {
  final String currentDayLabel;
  final List<Cart> openCarts;

  const _NewDayDialog({
    required this.currentDayLabel,
    required this.openCarts,
  });

  @override
  State<_NewDayDialog> createState() => _NewDayDialogState();
}

class _NewDayDialogState extends State<_NewDayDialog> {
  static const String _confirmWord = 'يوم جديد';

  int _step = 1;
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get _typedCorrectly => _controller.text.trim() == _confirmWord;

  @override
  Widget build(BuildContext context) {
    final open = widget.openCarts;
    final names = open.take(5).map((c) => '• ${c.customerName}').join('\n');
    final more = open.length > 5 ? '\n… و${open.length - 5} أخرى' : '';

    return AlertDialog(
      title: Text(_step == 1 ? 'إنشاء يوم جديد' : 'تأكيد نهائي'),
      content: SizedBox(
        width: 420,
        child: _step == 1
            ? Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('سيتم أرشفة يوم ${widget.currentDayLabel} وبدء يوم فارغ.'),
                  const SizedBox(height: 8),
                  const Text(
                      'لن يُحذف أي شيء: الفواتير والسلال تبقى محفوظة في السجل.'),
                  if (open.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    Text(
                      'يوجد ${open.length} سلة مفتوحة وستُحاسَب تلقائيًا الآن '
                      '(تُغلق جلساتها وتُحتسب مبالغها) قبل الأرشفة:',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text('$names$more'),
                  ],
                ],
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('للتأكيد اكتب العبارة التالية ثم اضغط تأكيد:'),
                  const SizedBox(height: 4),
                  const Text(_confirmWord,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _controller,
                    autofocus: true,
                    onChanged: (_) => setState(() {}),
                    decoration: const InputDecoration(border: OutlineInputBorder()),
                  ),
                ],
              ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('إلغاء'),
        ),
        if (_step == 1)
          ElevatedButton(
            onPressed: () => setState(() => _step = 2),
            child: const Text('متابعة'),
          )
        else
          ElevatedButton(
            onPressed:
                _typedCorrectly ? () => Navigator.of(context).pop(true) : null,
            child: const Text('تأكيد وإنشاء اليوم'),
          ),
      ],
    );
  }
}
