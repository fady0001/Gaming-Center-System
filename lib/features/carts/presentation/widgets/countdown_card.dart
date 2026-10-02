import 'package:flutter/material.dart';

import '../../../../core/theme/color_palette.dart';
import '../../../../core/theme/dimensions.dart';
import '../../domain/entities/cart.dart';
import 'format_helpers.dart';

/// بطاقة عدّاد تنازلي لجلسة محددة الوقت: الوقت المتبقي + شريط تقدّم.
/// أخضر عادةً، أصفر في آخر 5 دقائق، أحمر بعد انتهاء المدة (يعرض التجاوز).
class CountdownCard extends StatelessWidget {
  final CartPlayLine line;
  final DateTime now;
  final String chargeText;

  const CountdownCard({
    super.key,
    required this.line,
    required this.now,
    required this.chargeText,
  });

  @override
  Widget build(BuildContext context) {
    final planned = Duration(minutes: line.plannedMinutes!);
    final elapsed = now.difference(line.startedAt);
    final safeElapsed = elapsed.isNegative ? Duration.zero : elapsed;
    final remaining = planned - safeElapsed;
    final overdue = remaining.isNegative;

    final Color color = overdue
        ? ColorPalette.sessionOverdue
        : remaining <= const Duration(minutes: 5)
            ? ColorPalette.warning
            : ColorPalette.statusActive;

    final progress =
        (safeElapsed.inMilliseconds / planned.inMilliseconds).clamp(0.0, 1.0);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.radiusM),
        side: BorderSide(color: color, width: overdue ? 2 : 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.spaceS),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(overdue ? Icons.timer_off_outlined : Icons.timer_outlined,
                    color: color),
                const SizedBox(width: Dimensions.spaceS),
                Expanded(
                  child: Text(
                    line.playerCount == null
                        ? line.resourceName
                        : '${line.resourceName} — ${line.playerCount} لاعب',
                  ),
                ),
                Text(chargeText),
              ],
            ),
            const SizedBox(height: Dimensions.spaceXS),
            Text(
              overdue
                  ? 'تجاوز المدة بـ ${formatDuration(remaining)}'
                  : formatDuration(remaining),
              style: TextStyle(
                color: color,
                fontSize: overdue ? 20 : 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'المدة المحددة: ${line.plannedMinutes} دقيقة',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: Dimensions.spaceXS),
            LinearProgressIndicator(
              value: progress,
              color: color,
              backgroundColor: color.withValues(alpha: 0.15),
            ),
          ],
        ),
      ),
    );
  }
}
