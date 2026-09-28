import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/color_palette.dart';
import '../theme/dimensions.dart';
import '../theme/text_styles.dart';
import 'license_service.dart';


class LicenseLockPage extends StatelessWidget {
  final LicenseCheckResult result;
  final String licenseFilePath;

  const LicenseLockPage({
    super.key,
    required this.result,
    required this.licenseFilePath,
  });

  String get _message {
    switch (result.status) {
      case LicenseStatus.missingLicenseFile:
        return 'هذا الجهاز لم يُفعَّل بعد.\nيرجى إرسال "كود الجهاز" أدناه إلى الدعم الفني للحصول على ملف التفعيل.';
      case LicenseStatus.fingerprintMismatch:
        return 'ملف التفعيل الموجود خاص بجهاز آخر.\nيرجى إرسال "كود الجهاز" أدناه إلى الدعم الفني للحصول على ملف تفعيل جديد لهذا الجهاز.';
      case LicenseStatus.corruptLicenseFile:
        return 'ملف التفعيل تالف أو غير صالح.\nيرجى إرسال "كود الجهاز" أدناه إلى الدعم الفني للحصول على ملف تفعيل جديد.';
      case LicenseStatus.valid:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor =
        isDark ? ColorPalette.darkTextPrimary : ColorPalette.lightTextPrimary;
    final secondaryColor = isDark
        ? ColorPalette.darkTextSecondary
        : ColorPalette.lightTextSecondary;
    final surfaceColor =
        isDark ? ColorPalette.darkSurface : ColorPalette.lightSurface;

    return Scaffold(
      backgroundColor:
          isDark ? ColorPalette.darkBackground : ColorPalette.lightBackground,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Padding(
            padding: const EdgeInsets.all(Dimensions.spaceXL),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.lock_outline,
                    size: Dimensions.iconXL, color: ColorPalette.danger),
                const SizedBox(height: Dimensions.spaceM),
                Text(
                  'التطبيق غير مُفعَّل',
                  style: AppTextStyles.heading1(textColor),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: Dimensions.spaceS),
                Text(
                  _message,
                  style: AppTextStyles.bodyLarge(secondaryColor),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: Dimensions.spaceL),

            
                Container(
                  padding: const EdgeInsets.all(Dimensions.spaceM),
                  decoration: BoxDecoration(
                    color: surfaceColor,
                    borderRadius: BorderRadius.circular(Dimensions.radiusM),
                    border: Border.all(
                      color: isDark
                          ? ColorPalette.darkBorder
                          : ColorPalette.lightBorder,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text('كود الجهاز',
                          style: AppTextStyles.bodySmall(secondaryColor)),
                      const SizedBox(height: Dimensions.spaceXXS),
                      SelectableText(
                        result.currentDeviceFingerprint,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.priceDisplay(textColor)
                            .copyWith(fontSize: 16),
                      ),
                      const SizedBox(height: Dimensions.spaceS),
                      ElevatedButton.icon(
                        onPressed: () {
                          Clipboard.setData(
                            ClipboardData(
                                text: result.currentDeviceFingerprint),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('تم نسخ كود الجهاز')),
                          );
                        },
                        icon: const Icon(Icons.copy),
                        label: const Text('نسخ الكود'),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: Dimensions.spaceL),
                Text(
                  'بعد الحصول على ملف التفعيل (license.lic)، ضعه في المسار التالي '
                  'ثم أعد تشغيل التطبيق:',
                  style: AppTextStyles.bodySmall(secondaryColor),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: Dimensions.spaceXXS),
                SelectableText(
                  licenseFilePath,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodySmall(secondaryColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
