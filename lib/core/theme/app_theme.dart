import 'package:flutter/material.dart';
import 'color_palette.dart';
import 'text_styles.dart';


class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    final colorScheme = const ColorScheme.light(
      primary: ColorPalette.primary,
      onPrimary: Colors.white,
      surface: ColorPalette.lightSurface,
      onSurface: ColorPalette.lightTextPrimary,
      error: ColorPalette.danger,
      onError: Colors.white,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: ColorPalette.lightBackground,
      colorScheme: colorScheme,
      fontFamily: AppFonts.tajawal,
      dividerColor: ColorPalette.lightDivider,
      cardColor: ColorPalette.lightSurface,
      appBarTheme: AppBarTheme(
        backgroundColor: ColorPalette.lightSurface,
        foregroundColor: ColorPalette.lightTextPrimary,
        elevation: 0,
        titleTextStyle: AppTextStyles.heading3(ColorPalette.lightTextPrimary),
        centerTitle: true,
      ),
      textTheme: _buildTextTheme(ColorPalette.lightTextPrimary),
      elevatedButtonTheme: _elevatedButtonTheme(colorScheme),
      inputDecorationTheme: _inputDecorationTheme(
        fillColor: ColorPalette.lightSurfaceVariant,
        borderColor: ColorPalette.lightBorder,
      ),
      cardTheme: _cardTheme(ColorPalette.lightSurface, ColorPalette.lightBorder),
    );
  }

  static ThemeData get darkTheme {
    final colorScheme = const ColorScheme.dark(
      primary: ColorPalette.primaryLight,
      onPrimary: Colors.black,
      surface: ColorPalette.darkSurface,
      onSurface: ColorPalette.darkTextPrimary,
      error: ColorPalette.danger,
      onError: Colors.white,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: ColorPalette.darkBackground,
      colorScheme: colorScheme,
      fontFamily: AppFonts.tajawal,
      dividerColor: ColorPalette.darkDivider,
      cardColor: ColorPalette.darkSurface,
      appBarTheme: AppBarTheme(
        backgroundColor: ColorPalette.darkSurface,
        foregroundColor: ColorPalette.darkTextPrimary,
        elevation: 0,
        titleTextStyle: AppTextStyles.heading3(ColorPalette.darkTextPrimary),
        centerTitle: true,
      ),
      textTheme: _buildTextTheme(ColorPalette.darkTextPrimary),
      elevatedButtonTheme: _elevatedButtonTheme(colorScheme),
      inputDecorationTheme: _inputDecorationTheme(
        fillColor: ColorPalette.darkSurfaceVariant,
        borderColor: ColorPalette.darkBorder,
      ),
      cardTheme: _cardTheme(ColorPalette.darkSurface, ColorPalette.darkBorder),
    );
  }



  static TextTheme _buildTextTheme(Color textColor) {
    return TextTheme(
      displayLarge: AppTextStyles.heading1(textColor),
      headlineMedium: AppTextStyles.heading2(textColor),
      titleLarge: AppTextStyles.heading3(textColor),
      bodyLarge: AppTextStyles.bodyLarge(textColor),
      bodyMedium: AppTextStyles.bodyMedium(textColor),
      bodySmall: AppTextStyles.bodySmall(textColor),
      labelLarge: AppTextStyles.button(textColor),
    );
  }

  static ElevatedButtonThemeData _elevatedButtonTheme(ColorScheme scheme) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        minimumSize: const Size.fromHeight(52), // Dimensions.buttonHeight
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Dimensions.radiusM
        ),
        textStyle: AppTextStyles.button(scheme.onPrimary),
      ),
    );
  }

  static InputDecorationTheme _inputDecorationTheme({
    required Color fillColor,
    required Color borderColor,
  }) {
    final radius = BorderRadius.circular(10); // Dimensions.radiusM
    return InputDecorationTheme(
      filled: true,
      fillColor: fillColor,
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: radius,
        borderSide: BorderSide(color: borderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: radius,
        borderSide: BorderSide(color: borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: radius,
        borderSide: const BorderSide(color: ColorPalette.primary, width: 1.5),
      ),
    );
  }

  static CardThemeData _cardTheme(Color surfaceColor, Color borderColor) {
    return CardThemeData(
      color: surfaceColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), // Dimensions.radiusL
        side: BorderSide(color: borderColor),
      ),
    );
  }
}
