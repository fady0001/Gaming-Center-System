import 'package:flutter/material.dart';

/// حقل رقمي بسيط (سعر أو دقائق) بنفس الشكل داخل نوافذ الإدارة.
Widget adminNumberField({
  required TextEditingController controller,
  required String label,
  bool decimal = false,
  IconData? icon,
}) {
  return TextField(
    controller: controller,
    textDirection: TextDirection.ltr,
    keyboardType: TextInputType.numberWithOptions(decimal: decimal),
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: icon == null ? null : Icon(icon),
    ),
  );
}
