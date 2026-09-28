import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/usecases/calculate_session_charge.dart';
import '../../../../core/theme/dimensions.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../sessions/domain/entities/active_session.dart';
import '../../../sessions/presentation/cubit/active_sessions_cubit.dart';
import '../../domain/entities/table_entity.dart';

class TableSessionSheet extends StatelessWidget {
  final TableEntity table;
  final ActiveSession? activeSession;

  const TableSessionSheet({
    super.key,
    required this.table,
    required this.activeSession,
  });

  static Future<void> show(
    BuildContext context, {
    required TableEntity table,
    required ActiveSession? activeSession,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => TableSessionSheet(table: table, activeSession: activeSession),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onSurface;

    return Padding(
      padding: EdgeInsets.only(
        left: Dimensions.spaceL,
        right: Dimensions.spaceL,
        top: Dimensions.spaceL,
        bottom: MediaQuery.of(context).viewInsets.bottom + Dimensions.spaceL,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(table.name, style: AppTextStyles.heading2(textColor)),
          const SizedBox(height: Dimensions.spaceM),
          if (activeSession == null)
            _StartSessionButton(table: table)
          else
            _ActiveSessionSummary(session: activeSession!),
        ],
      ),
    );
  }
}

class _StartSessionButton extends StatelessWidget {
  final TableEntity table;
  const _StartSessionButton({required this.table});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(Dimensions.buttonHeight),
      ),
      onPressed: () async {
        await context.read<ActiveSessionsCubit>().startSession(
              resourceType: SessionResourceType.billiardTable,
              resourceId: table.id,
              rate: table.defaultRate,
            );
        if (context.mounted) Navigator.of(context).pop();
      },
      icon: const Icon(Icons.play_arrow),
      label: const Text('بدء جلسة على هذه الطاولة'),
    );
  }
}

class _ActiveSessionSummary extends StatelessWidget {
  final ActiveSession session;
  const _ActiveSessionSummary({required this.session});

  static const _calculateCharge = CalculateSessionCharge();

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onSurface;
    final now = DateTime.now();
    final charge = _calculateCharge(
      startTime: session.startTime,
      endTime: now,
      rate: session.rateSnapshot,
    );
    final cafeteriaTotal = session.cafeteriaCharges;
    final liveTotal = charge.amount + cafeteriaTotal;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _SummaryRow(label: 'بدأت الساعة', value: _formatTime(session.startTime)),
        _SummaryRow(label: 'مبلغ الوقت (حتى الآن)', value: charge.amount.toDisplayString()),
        _SummaryRow(label: 'طلبات الكافتيريا', value: cafeteriaTotal.toDisplayString()),
        const Divider(),
        _SummaryRow(
          label: 'الإجمالي حتى الآن',
          value: liveTotal.toDisplayString(),
          emphasize: true,
        ),
        const SizedBox(height: Dimensions.spaceM),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(Dimensions.buttonHeight),
          ),
          onPressed: () async {
            final summary =
                await context.read<ActiveSessionsCubit>().closeSession(session.id);
            if (context.mounted) {
              Navigator.of(context).pop();
              _showInvoicePreview(context, summary.total.toDisplayString());
            }
          },
          icon: const Icon(Icons.point_of_sale),
          label: const Text('إنهاء الجلسة وإصدار الفاتورة'),
        ),
      ],
    );
  }

  void _showInvoicePreview(BuildContext context, String totalDisplay) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('تم إنهاء الجلسة'),
        content: Text(
          'الإجمالي المستحق: $totalDisplay\n\n'
          '(شاشة الفاتورة الكاملة القابلة للطباعة ستُبنى في ميزة الفوترة القادمة)',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('حسنًا'),
          ),
        ],
      ),
    );
  }

  String _formatTime(DateTime t) {
    final hh = t.hour.toString().padLeft(2, '0');
    final mm = t.minute.toString().padLeft(2, '0');
    return '$hh:$mm';
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool emphasize;
  const _SummaryRow({
    required this.label,
    required this.value,
    this.emphasize = false,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onSurface;
    final style = emphasize
        ? AppTextStyles.heading3(textColor)
        : AppTextStyles.bodyMedium(textColor);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimensions.spaceXXS),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: style),
          Text(value, style: style),
        ],
      ),
    );
  }
}
