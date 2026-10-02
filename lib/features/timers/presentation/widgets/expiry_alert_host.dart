import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/alerts/alert_center.dart';
import '../../../../core/theme/color_palette.dart';
import '../../../carts/presentation/cubit/carts_cubit.dart';
import '../../../carts/presentation/widgets/format_helpers.dart';
import '../../../sessions/presentation/cubit/active_sessions_cubit.dart';
import '../../data/expiry_alert_notifier.dart';
import '../../domain/entities/expiry_alert.dart';
import '../../domain/usecases/find_expired_play_lines.dart';

/// يراقب السلال المفتوحة وعند انتهاء مدة جلسة محددة الوقت يشغّل النغمة
/// ويرسل إشعار سطح المكتب ويعرض تنبيهًا داخل التطبيق (اسم الزبون، الجهاز،
/// الزمن المنقضي). يُنبَّه مرة واحدة لكل جلسة.
class ExpiryAlertHost extends StatefulWidget {
  final Widget child;
  const ExpiryAlertHost({super.key, required this.child});

  @override
  State<ExpiryAlertHost> createState() => _ExpiryAlertHostState();
}

class _ExpiryAlertHostState extends State<ExpiryAlertHost> {
  static const String _alertId = 'expiry';

  final Set<int> _alerted = {};
  final List<ExpiryAlert> _pending = [];
  late final CartsCubit _carts;
  late final ActiveSessionsCubit _sessions;
  final List<StreamSubscription<dynamic>> _subs = [];

  @override
  void initState() {
    super.initState();
    _carts = context.read<CartsCubit>();
    _sessions = context.read<ActiveSessionsCubit>();
    // الجلسات تنبض كل ثانية، والسلال تتغير عند الإضافة/الدفع.
    _subs.add(_sessions.stream.listen((_) => _check()));
    _subs.add(_carts.stream.listen((_) => _check()));
    _check();
  }

  void _check() {
    final carts = _carts.state.carts;
    if (_carts.state.isLoading) return;

    // تنظيف: جلسة سُوّيت أو أُغلقت سلتها لا نحتاج تذكّرها.
    _alerted.retainAll(liveFixedTimeLineIds(carts));

    final fresh = findExpiredPlayLines(carts, _sessions.state.now, _alerted);
    if (fresh.isEmpty) return;

    _alerted.addAll(fresh.map((a) => a.playLineId));
    _pending.addAll(fresh);
    ExpiryAlertNotifier.instance.notify(fresh);
    _showAlert();
  }

  void _showAlert() {
    final lines = _pending
        .map((a) => '${a.customerName} — ${a.deviceName} — '
            'المنقضي ${formatDuration(a.elapsed)}')
        .join('\n');
    AlertCenter.instance.show(AppAlert(
      id: _alertId,
      icon: Icons.timer_off_outlined,
      color: ColorPalette.danger,
      title: 'انتهى وقت اللعب',
      body: lines,
      onDismiss: _pending.clear,
    ));
  }

  @override
  void dispose() {
    for (final s in _subs) {
      s.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
