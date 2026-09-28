import 'package:flutter/material.dart';

/// يسأل عن اسم الزبون ويعيده (أو null عند الإلغاء).
Future<String?> askCustomerName(BuildContext context) {
  final controller = TextEditingController();
  return showDialog<String>(
    context: context,
    builder: (dialogContext) {
      void submit() {
        final name = controller.text.trim();
        if (name.isNotEmpty) Navigator.of(dialogContext).pop(name);
      }

      return AlertDialog(
        title: const Text('سلة جديدة'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(labelText: 'اسم الزبون'),
          onSubmitted: (_) => submit(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('إلغاء'),
          ),
          ElevatedButton(onPressed: submit, child: const Text('إنشاء')),
        ],
      );
    },
  );
}
