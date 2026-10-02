import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../carts/presentation/cubit/carts_cubit.dart';
import '../cubit/work_day_cubit.dart';
import 'new_day_dialog.dart';

/// شريط صغير في الـ AppBar: اسم اليوم الحالي + زر "إنشاء يوم جديد".
class WorkDayAction extends StatelessWidget {
  const WorkDayAction({super.key});

  Future<void> _onPressed(BuildContext context) async {
    final cubit = context.read<WorkDayCubit>();
    final openCarts = context.read<CartsCubit>().state.carts;
    final label = cubit.state.currentDay?.label ?? '';
    final messenger = ScaffoldMessenger.of(context);

    final confirmed = await confirmNewDay(
      context,
      currentDayLabel: label,
      openCarts: openCarts,
    );
    if (!confirmed) return;

    try {
      final r = await cubit.startNewDay();
      messenger.showSnackBar(SnackBar(
        content: Text('تمت أرشفة يوم ${r.archivedDay.label}'
            '${r.settledCarts > 0 ? ' (حوسبت ${r.settledCarts} سلة)' : ''}'
            ' — بدأ يوم ${r.newDay.label}'),
      ));
    } catch (e) {
      messenger.showSnackBar(SnackBar(content: Text('تعذّر إنشاء يوم جديد: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<WorkDayCubit>().state;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (state.currentDay != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(state.currentDay!.label),
          ),
        TextButton.icon(
          onPressed: state.isRollingOver ? null : () => _onPressed(context),
          icon: const Icon(Icons.event_repeat),
          label: const Text('إنشاء يوم جديد'),
        ),
      ],
    );
  }
}
