import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:local_notifier/local_notifier.dart';
import 'package:window_manager/window_manager.dart';

import '../../carts/presentation/widgets/format_helpers.dart';
import '../domain/entities/expiry_alert.dart';

/// صوت التنبيه + إشعار سطح مكتب (Windows toast). أي فشل هنا (جهاز بلا صوت،
/// إشعارات معطلة…) يُسجَّل فقط ولا يوقف التطبيق.
class ExpiryAlertNotifier {
  ExpiryAlertNotifier._();
  static final ExpiryAlertNotifier instance = ExpiryAlertNotifier._();

  final AudioPlayer _player = AudioPlayer();
  bool _ready = false;

  Future<void> init() async {
    try {
      await localNotifier.setup(
        appName: 'إدارة صالة الألعاب',
        shortcutPolicy: ShortcutPolicy.requireCreate,
      );
      _ready = true;
    } catch (e) {
      debugPrint('local_notifier setup failed: $e');
    }
  }

  Future<void> playChime() async {
    try {
      await _player.stop();
      await _player.play(AssetSource('sounds/chime.wav'));
    } catch (e) {
      debugPrint('chime failed: $e');
    }
  }

  Future<void> showToast(ExpiryAlert alert) => showText(
        title: 'انتهى الوقت — ${alert.customerName}',
        body: 'الجهاز: ${alert.deviceName}\n'
            'المدة المنقضية: ${formatDuration(alert.elapsed)}',
      );

  /// إشعار سطح مكتب عام (الضغط عليه يُظهر نافذة التطبيق).
  Future<void> showText({required String title, required String body}) async {
    if (!_ready) return;
    try {
      final toast = LocalNotification(
        title: title,
        body: body,
        silent: true, // الصوت نشغّله بأنفسنا مرة واحدة لكل دفعة
      );
      toast.onClick = () async {
        await windowManager.show();
        await windowManager.focus();
      };
      await toast.show();
    } catch (e) {
      debugPrint('toast failed: $e');
    }
  }

  Future<void> notify(List<ExpiryAlert> alerts) async {
    if (alerts.isEmpty) return;
    await playChime();
    for (final a in alerts) {
      await showToast(a);
    }
  }
}
