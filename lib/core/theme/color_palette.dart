import 'package:flutter/material.dart';


class ColorPalette {
  ColorPalette._(); 


  static const Color primary = Color(0xFF0D6E6E); 
  static const Color primaryLight = Color(0xFF3F9C9C);
  static const Color primaryDark = Color(0xFF063E3E);

  static const Color success = Color(0xFF2E7D32);
  static const Color warning = Color(0xFFF9A825); 
  static const Color danger = Color(0xFFC62828); 
  static const Color info = Color(0xFF1565C0);

  // ---------------------------------------------------------------------
  // الوضع الفاتح (Light Mode)
  // ---------------------------------------------------------------------
  static const Color lightBackground = Color(0xFFF5F7F8);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightSurfaceVariant = Color(0xFFEDEFF1);
  static const Color lightTextPrimary = Color(0xFF1A1D1E);
  static const Color lightTextSecondary = Color(0xFF5C6366);
  static const Color lightBorder = Color(0xFFDDE2E4);
  static const Color lightDivider = Color(0xFFE3E6E8);

  // ---------------------------------------------------------------------
  // الوضع الداكن (Dark Mode)
  // ---------------------------------------------------------------------
  static const Color darkBackground = Color(0xFF121517);
  static const Color darkSurface = Color(0xFF1C2022);
  static const Color darkSurfaceVariant = Color(0xFF262B2E);
  static const Color darkTextPrimary = Color(0xFFF2F4F5);
  static const Color darkTextSecondary = Color(0xFFA9B0B3);
  static const Color darkBorder = Color(0xFF33393C);
  static const Color darkDivider = Color(0xFF2A2F32);

  // ---------------------------------------------------------------------
  // ألوان مخصصة لحالات الجلسات (مفيدة جدًا لموظف غير تقني ليفهم الحالة
  // بلمحة بصرية سريعة دون قراءة نص)
  // ---------------------------------------------------------------------
  // حالات الأجهزة (شريط الحالة العلوي)
  static const Color statusActive = Color(0xFF10B981); // شغالة
  static const Color statusIdle = Color(0xFF06B6D4); // شاغرة
  static const Color statusMaintenance = Color(0xFFB85450); // معطلة/صيانة

  static const Color sessionActive = Color(0xFF2E7D32); // طاولة/جهاز مشغول
  static const Color sessionIdle = Color(0xFF9E9E9E); // طاولة/جهاز فارغ
  static const Color sessionOverdue = Color(0xFFC62828); // تجاوز الوقت المحجوز
  static const Color sessionReserved = Color(0xFF1565C0); // محجوز مسبقًا
}
