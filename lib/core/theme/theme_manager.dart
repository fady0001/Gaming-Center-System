import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';


const String _themePrefsKey = 'app_theme_mode';


class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light) {
    _loadSavedTheme();
  }


  Future<void> _loadSavedTheme() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedValue = prefs.getString(_themePrefsKey);
      if (savedValue == 'dark') {
        emit(ThemeMode.dark);
      } else if (savedValue == 'light') {
        emit(ThemeMode.light);
      }
  
    } catch (e) {
      debugPrint('تعذّرت قراءة تفضيل الثيم المحفوظ: $e');
    }
  }

  Future<void> toggleTheme() async {
    final newMode =
        state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    emit(newMode);
    await _persistTheme(newMode);
  }

  Future<void> setTheme(ThemeMode mode) async {
    if (mode == state) return;
    emit(mode);
    await _persistTheme(mode);
  }

  Future<void> _persistTheme(ThemeMode mode) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
        _themePrefsKey,
        mode == ThemeMode.dark ? 'dark' : 'light',
      );
    } catch (e) {
      debugPrint('تعذّر حفظ تفضيل الثيم: $e');
    }
  }
}
