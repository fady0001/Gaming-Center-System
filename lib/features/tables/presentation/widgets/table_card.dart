import 'package:flutter/material.dart';

import '../../../../core/domain/usecases/calculate_session_charge.dart';
import '../../../../core/theme/color_palette.dart';
import '../../../../core/theme/dimensions.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../sessions/domain/entities/active_session.dart';
import '../../domain/entities/table_entity.dart';

/// بطاقة طاولة واحدة داخل الشبكة. تعتمد بالكامل على الألوان لتوصيل الحالة
/// بلمحة بصرية سريعة (موظف يراقب عشرات الطاولات في نفس الوقت لا وقت لديه
/// لقراءة نص طويل لكل بطاقة).
class TableCard extends StatelessWidget {
  final TableEntity table;
  final ActiveSession? activeSession;
  final DateTime now;
  final VoidCallback onTap;

  const TableCard({
    super.key,
    required this.table,
    required this.activeSession,
    required this.now,
    required this.onTap,
  });

  static const _calculateCharge = CalculateSessionCharge();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor =
        isDark ? ColorPalette.darkTextPrimary : ColorPalette.lightTextPrimary;
    final session = activeSession;
    final statusColor =
        session != null ? ColorPalette.sessionActive : ColorPalette.sessionIdle;

    String elapsedText = 'فارغة';
    String priceText = '';
    if (session != null) {
      final charge = _calculateCharge(
        startTime: session.startTime,
        endTime: now,
        rate: session.rateSnapshot,
      );
      elapsedText = _formatDuration(charge.actualDuration);
      priceText = charge.amount.toDisplayString();
    }

    return Material(
      color: isDark ? ColorPalette.darkSurface : ColorPalette.lightSurface,
      borderRadius: BorderRadius.circular(Dimensions.radiusL),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(Dimensions.radiusL),
        child: Container(
          constraints:
              const BoxConstraints(minHeight: Dimensions.tableCardMinHeight),
          padding: const EdgeInsets.all(Dimensions.spaceM),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radiusL),
            border: Border.all(color: statusColor, width: 2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      table.name,
                      style: AppTextStyles.heading3(textColor),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    width: 12,
                    height: 12,
                    decoration:
                        BoxDecoration(color: statusColor, shape: BoxShape.circle),
                  ),
                ],
              ),
              if (session != null) ...[
                Text(elapsedText,
                    style: AppTextStyles.counterDisplay(statusColor)
                        .copyWith(fontSize: 22)),
                Text('$priceText', style: AppTextStyles.priceDisplay(textColor)),
              ] else
                Text('اضغط لبدء جلسة',
                    style: AppTextStyles.bodySmall(
                        isDark ? ColorPalette.darkTextSecondary : ColorPalette.lightTextSecondary)),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDuration(Duration d) {
    final h = d.inHours;
    final m = d.inMinutes % 60;
    final s = d.inSeconds % 60;
    final hh = h.toString().padLeft(2, '0');
    final mm = m.toString().padLeft(2, '0');
    final ss = s.toString().padLeft(2, '0');
    return h > 0 ? '$hh:$mm:$ss' : '$mm:$ss';
  }
}
