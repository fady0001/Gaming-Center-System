import 'package:tray_manager/tray_manager.dart';
import 'package:window_manager/window_manager.dart';

class AppLifecycleService with TrayListener, WindowListener {
  AppLifecycleService._();
  static final AppLifecycleService instance = AppLifecycleService._();

  bool _initialized = false;

  Future<void> initialize() async {
    if (_initialized) return;
    _initialized = true;

    await windowManager.ensureInitialized();
    windowManager.addListener(this);

    await windowManager.setPreventClose(true);

    trayManager.addListener(this);

   
    try {
      await trayManager.setIcon('assets/icons/tray_icon.ico');
      await trayManager.setToolTip('إدارة صالة الألعاب والبلياردو');
      await trayManager.setContextMenu(Menu(items: [
        MenuItem(key: 'show_window', label: 'إظهار التطبيق'),
        MenuItem.separator(),
        MenuItem(key: 'exit_app', label: 'إغلاق التطبيق نهائيًا'),
      ]));
    } catch (e) {
      // ignore: avoid_print
      print(
        'تعذّر تفعيل أيقونة شريط النظام (على الأغلب الملف assets/icons/'
        'tray_icon.ico غير موجود بعد أو غير مُصرَّح به في pubspec.yaml تحت '
        'assets:). التطبيق سيستمر بالعمل بشكل طبيعي بدون أيقونة الشريط. '
        'الخطأ التفصيلي: $e',
      );
    }
  }

  @override
  void onWindowClose() async {
    final shouldHideInsteadOfClose = await windowManager.isPreventClose();
    if (shouldHideInsteadOfClose) {
      await windowManager.hide();
    }
  }

  @override
  void onTrayIconMouseDown() async {
    await windowManager.show();
    await windowManager.focus();
  }

  @override
  void onTrayMenuItemClick(MenuItem menuItem) async {
    switch (menuItem.key) {
      case 'show_window':
        await windowManager.show();
        await windowManager.focus();
        break;
      case 'exit_app':
   
        await windowManager.setPreventClose(false);
        await windowManager.close();
        break;
    }
  }

  Future<void> dispose() async {
    windowManager.removeListener(this);
    trayManager.removeListener(this);
  }
}
