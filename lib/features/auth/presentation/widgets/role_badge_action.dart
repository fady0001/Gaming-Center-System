import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/color_palette.dart';
import '../../domain/entities/app_role.dart';
import '../cubit/auth_cubit.dart';


class RoleBadgeAction extends StatelessWidget {
  const RoleBadgeAction({super.key});

  @override
  Widget build(BuildContext context) {
    final role = context.watch<AuthCubit>().state.role;
    final isManager = role == AppRole.manager;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Chip(
            avatar: Icon(
              isManager
                  ? Icons.admin_panel_settings_outlined
                  : Icons.person_outline,
              size: 18,
              color: Colors.white,
            ),
            label: Text(isManager ? 'مدير' : 'موظف'),
            backgroundColor:
                isManager ? ColorPalette.info : ColorPalette.primaryLight,
            labelStyle: const TextStyle(color: Colors.white),
          ),
          IconButton(
            tooltip: 'تسجيل الخروج',
            icon: const Icon(Icons.logout),
            onPressed: () => _confirmLogout(context),
          ),
        ],
      ),
    );
  }

  void _confirmLogout(BuildContext context) {
    final authCubit = context.read<AuthCubit>();
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('تسجيل الخروج'),
        content: const Text('هل تريد العودة لشاشة اختيار الدور؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('إلغاء'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              authCubit.logout();
            },
            child: const Text('تسجيل الخروج'),
          ),
        ],
      ),
    );
  }
}
