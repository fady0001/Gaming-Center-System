import 'package:flutter/material.dart';

/// تنبيه ظاهر فوق أي صفحة (انتهاء وقت جلسة، تذكير حجز…).
class AppAlert {
  final String id;
  final String title;
  final String body;
  final IconData icon;
  final Color color;
  final String? actionLabel;
  final Future<void> Function()? onAction;
  final VoidCallback? onDismiss;

  const AppAlert({
    required this.id,
    required this.title,
    required this.body,
    required this.icon,
    required this.color,
    this.actionLabel,
    this.onAction,
    this.onDismiss,
  });
}

/// مركز تنبيهات واحد لكل التطبيق، يسمح بعدّة تنبيهات معًا بلا تعارض.
/// عرض تنبيه بنفس [AppAlert.id] يستبدل القديم.
class AlertCenter extends ChangeNotifier {
  AlertCenter._();
  static final AlertCenter instance = AlertCenter._();

  final Map<String, AppAlert> _alerts = {};

  List<AppAlert> get alerts => _alerts.values.toList();

  void show(AppAlert alert) {
    _alerts[alert.id] = alert;
    notifyListeners();
  }

  void dismiss(String id) {
    final removed = _alerts.remove(id);
    if (removed == null) return;
    removed.onDismiss?.call();
    notifyListeners();
  }
}

/// يغلّف التطبيق ويرسم التنبيهات أعلى الشاشة. يجب أن يكون داخل Directionality.
class AlertOverlay extends StatelessWidget {
  final Widget child;
  const AlertOverlay({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(
          top: 8,
          left: 16,
          right: 16,
          child: Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 560),
              child: ListenableBuilder(
                listenable: AlertCenter.instance,
                builder: (context, _) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (final a in AlertCenter.instance.alerts)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: _AlertCard(alert: a),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _AlertCard extends StatelessWidget {
  final AppAlert alert;
  const _AlertCard({required this.alert});

  @override
  Widget build(BuildContext context) {
    const white = TextStyle(color: Colors.white);
    return Material(
      color: alert.color,
      elevation: 6,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(alert.icon, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(alert.title,
                      style: white.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 2),
                  Text(alert.body, style: white),
                ],
              ),
            ),
            if (alert.actionLabel != null && alert.onAction != null)
              TextButton(
                onPressed: () => alert.onAction!(),
                child: Text(alert.actionLabel!, style: white),
              ),
            TextButton(
              onPressed: () => AlertCenter.instance.dismiss(alert.id),
              child: const Text('إخفاء', style: white),
            ),
          ],
        ),
      ),
    );
  }
}
