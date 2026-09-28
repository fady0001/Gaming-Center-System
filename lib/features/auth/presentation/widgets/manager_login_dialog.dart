import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/color_palette.dart';
import '../../../../core/theme/dimensions.dart';
import '../../../../core/theme/text_styles.dart';
import '../cubit/auth_cubit.dart';


class ManagerLoginDialog extends StatefulWidget {
  const ManagerLoginDialog({super.key});

  static Future<void> show(BuildContext context) {

    context.read<AuthCubit>().clearError();
    return showDialog(
      context: context,
      builder: (dialogContext) => BlocProvider.value(
        value: context.read<AuthCubit>(),
        child: const ManagerLoginDialog(),
      ),
    );
  }

  @override
  State<ManagerLoginDialog> createState() => _ManagerLoginDialogState();
}

class _ManagerLoginDialogState extends State<ManagerLoginDialog> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    final success = context.read<AuthCubit>().loginAsManager(
          username: _usernameController.text,
          password: _passwordController.text,
        );
    if (success && mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor =
        isDark ? ColorPalette.darkTextPrimary : ColorPalette.lightTextPrimary;

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.radiusL),
      ),
      title: Text('دخول المدير', style: AppTextStyles.heading3(textColor)),
      content: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, authState) {
          return SizedBox(
            width: 340,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _usernameController,
                  textDirection: TextDirection.ltr,
                  autofocus: true,
                  decoration: const InputDecoration(
                    labelText: 'اسم المستخدم',
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                  onSubmitted: (_) => _submit(),
                ),
                const SizedBox(height: Dimensions.spaceM),
                TextField(
                  controller: _passwordController,
                  textDirection: TextDirection.ltr,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: 'كلمة السر',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(_obscurePassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined),
                      onPressed: () => setState(
                          () => _obscurePassword = !_obscurePassword),
                    ),
                  ),
                  onSubmitted: (_) => _submit(),
                ),
                if (authState.errorMessage != null) ...[
                  const SizedBox(height: Dimensions.spaceS),
                  Text(
                    authState.errorMessage!,
                    style: AppTextStyles.bodySmall(ColorPalette.danger),
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
            ),
          );
        },
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('إلغاء'),
        ),
        ElevatedButton(
          onPressed: _submit,
          style: ElevatedButton.styleFrom(backgroundColor: ColorPalette.primary),
          child: Text('دخول', style: AppTextStyles.button(Colors.white)),
        ),
      ],
    );
  }
}
