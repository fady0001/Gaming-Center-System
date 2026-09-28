import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/color_palette.dart';
import '../../../../core/theme/dimensions.dart';
import '../../../../core/theme/text_styles.dart';
import '../cubit/auth_cubit.dart';
import '../widgets/manager_login_dialog.dart';

class RoleGatePage extends StatelessWidget {
  const RoleGatePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor =
        isDark ? ColorPalette.darkTextPrimary : ColorPalette.lightTextPrimary;
    final secondaryColor = isDark
        ? ColorPalette.darkTextSecondary
        : ColorPalette.lightTextSecondary;

    return Scaffold(
      backgroundColor:
          isDark ? ColorPalette.darkBackground : ColorPalette.lightBackground,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Padding(
            padding: const EdgeInsets.all(Dimensions.spaceXL),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.sports_esports,
                    size: Dimensions.iconXL, color: ColorPalette.primary),
                const SizedBox(height: Dimensions.spaceM),
                Text(
                  'إدارة صالة الألعاب والبلياردو',
                  style: AppTextStyles.heading1(textColor),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: Dimensions.spaceXS),
                Text(
                  'اختر طريقة الدخول',
                  style: AppTextStyles.bodyLarge(secondaryColor),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: Dimensions.spaceXL),

   
                SizedBox(
                  width: double.infinity,
                  height: Dimensions.buttonHeight,
                  child: ElevatedButton.icon(
                    onPressed: () =>
                        context.read<AuthCubit>().continueAsEmployee(),
                    icon: const Icon(Icons.person_outline),
                    label: Text('دخول كموظف',
                        style: AppTextStyles.button(Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorPalette.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radiusM),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: Dimensions.spaceM),

                SizedBox(
                  width: double.infinity,
                  height: Dimensions.buttonHeight,
                  child: OutlinedButton.icon(
                    onPressed: () => ManagerLoginDialog.show(context),
                    icon: const Icon(Icons.admin_panel_settings_outlined),
                    label: Text('دخول كمدير',
                        style: AppTextStyles.button(ColorPalette.primary)),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: ColorPalette.primary),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radiusM),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
