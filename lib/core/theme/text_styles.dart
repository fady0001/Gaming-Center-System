import 'package:flutter/material.dart';


class AppFonts {
  AppFonts._();
  static const String cairo = 'Cairo'; // للعناوين
  static const String tajawal = 'Tajawal'; // للنصوص العادية (أوضح في الفقرات)
}


class AppTextStyles {
  AppTextStyles._();


  static TextStyle heading1(Color color) => TextStyle(
        fontFamily: AppFonts.cairo,
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: color,
        height: 1.3,
      );

  static TextStyle heading2(Color color) => TextStyle(
        fontFamily: AppFonts.cairo,
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: color,
        height: 1.3,
      );

  static TextStyle heading3(Color color) => TextStyle(
        fontFamily: AppFonts.cairo,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: color,
        height: 1.3,
      );

  // نص عادي للفقرات والبيانات
  static TextStyle bodyLarge(Color color) => TextStyle(
        fontFamily: AppFonts.tajawal,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: color,
        height: 1.5,
      );

  static TextStyle bodyMedium(Color color) => TextStyle(
        fontFamily: AppFonts.tajawal,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: color,
        height: 1.5,
      );

  static TextStyle bodySmall(Color color) => TextStyle(
        fontFamily: AppFonts.tajawal,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: color,
        height: 1.4,
      );

  // نص الأزرار
  static TextStyle button(Color color) => TextStyle(
        fontFamily: AppFonts.cairo,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: color,
      );


  static TextStyle counterDisplay(Color color) => TextStyle(
        fontFamily: AppFonts.cairo,
        fontSize: 36,
        fontWeight: FontWeight.w700,
        color: color,
        fontFeatures: const [FontFeature.tabularFigures()],
      );

  static TextStyle priceDisplay(Color color) => TextStyle(
        fontFamily: AppFonts.cairo,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: color,
        fontFeatures: const [FontFeature.tabularFigures()],
      );

  // اختصارات جاهزة للاستخدام المباشر مع سياق الثيم الحالي
  static TextStyle heading1Of(BuildContext context) =>
      heading1(Theme.of(context).colorScheme.onSurface);
  static TextStyle bodyMediumOf(BuildContext context) =>
      bodyMedium(Theme.of(context).colorScheme.onSurface);
}
