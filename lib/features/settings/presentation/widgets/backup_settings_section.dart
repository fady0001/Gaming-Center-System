import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../../../core/backup/backup_service.dart';
import '../../../../core/theme/dimensions.dart';
import '../../../../core/theme/text_styles.dart';


class BackupSettingsSection extends StatefulWidget {
  const BackupSettingsSection({super.key});

  @override
  State<BackupSettingsSection> createState() => _BackupSettingsSectionState();
}

class _BackupSettingsSectionState extends State<BackupSettingsSection> {
  DateTime? _lastBackupTime;
  bool _isWorking = false;

  @override
  void initState() {
    super.initState();
    _loadLastBackupTime();
  }

  Future<void> _loadLastBackupTime() async {
    final time = await BackupService.getLastBackupTime();
    if (mounted) setState(() => _lastBackupTime = time);
  }

  Future<void> _runManualBackup() async {

    final selectedFolder = await FilePicker.getDirectoryPath(
      dialogTitle: 'اختر مكان حفظ النسخة الاحتياطية',
    );
    if (selectedFolder == null) return; // المستخدم ألغى الاختيار

    setState(() => _isWorking = true);
    final result = await BackupService.runBackupNow(
      trigger: BackupTrigger.manual,
      overrideFolderPath: selectedFolder,
    );
    setState(() => _isWorking = false);

    if (!mounted) return;
    _showResultDialog(
      success: result.success,
      message: result.success
          ? 'تم إنشاء النسخة الاحتياطية بنجاح في:\n${result.filePath}'
          : result.errorMessage ?? 'حدث خطأ غير متوقع.',
    );
    if (result.success) _loadLastBackupTime();
  }

  Future<void> _runRestore() async {
    final confirmed = await _confirmRestoreWithUser();
    if (!confirmed) return;

    // ملاحظة: نستخدم pickFile() (مفرد) وليس pickFiles()، لأننا نريد ملفًا
    // واحدًا فقط أصلاً. في file_picker v13، pickFiles() صار يُرجع
    // List<PlatformFile> مباشرة بدل FilePickerResult (أُزيل تمامًا)، وقائمة
    // فارغة تعني أن المستخدم ألغى الاختيار - وليس null كما في نسخ أقدم.
    final pickedFile = await FilePicker.pickFile(
      dialogTitle: 'اختر ملف النسخة الاحتياطية (.isar)',
      type: FileType.custom,
      allowedExtensions: ['isar'],
    );
    final path = pickedFile?.path;
    if (path == null) return;

    setState(() => _isWorking = true);
    final result = await BackupService.restoreFromFile(path);
    setState(() => _isWorking = false);

    if (!mounted) return;
    _showResultDialog(
      success: result.success,
      message: result.success
          ? 'تمت استعادة البيانات بنجاح. يُفضَّل إعادة تشغيل التطبيق الآن.'
          : result.errorMessage ?? 'حدث خطأ غير متوقع أثناء الاستعادة.',
    );
  }

  Future<bool> _confirmRestoreWithUser() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('تأكيد الاستعادة'),
        content: const Text(
          'سيتم استبدال جميع البيانات الحالية بالبيانات الموجودة في النسخة '
          'الاحتياطية المختارة. هذا الإجراء لا يمكن التراجع عنه بسهولة. '
          'هل أنت متأكد من المتابعة؟',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('إلغاء'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('نعم، استرجع'),
          ),
        ],
      ),
    );
    return confirmed ?? false;
  }

  void _showResultDialog({required bool success, required String message}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(success ? 'تمت العملية بنجاح' : 'فشلت العملية'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('حسنًا'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onSurface;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.spaceM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('النسخ الاحتياطي', style: AppTextStyles.heading3(textColor)),
            const SizedBox(height: Dimensions.spaceXS),
            Text(
              _lastBackupTime == null
                  ? 'لم يتم إنشاء أي نسخة احتياطية بعد.'
                  : 'آخر نسخة احتياطية: ${_lastBackupTime!.toLocal()}',
              style: AppTextStyles.bodyMedium(textColor),
            ),
            const SizedBox(height: Dimensions.spaceM),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _isWorking ? null : _runManualBackup,
                    icon: const Icon(Icons.backup),
                    label: const Text('نسخ احتياطي الآن'),
                  ),
                ),
                const SizedBox(width: Dimensions.spaceS),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _isWorking ? null : _runRestore,
                    icon: const Icon(Icons.restore),
                    label: const Text('استرجاع من ملف'),
                  ),
                ),
              ],
            ),
            if (_isWorking) ...[
              const SizedBox(height: Dimensions.spaceS),
              const LinearProgressIndicator(),
            ],
          ],
        ),
      ),
    );
  }
}