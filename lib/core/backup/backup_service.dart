import 'dart:async';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../database/database_config.dart';

enum BackupTrigger { manual, automatic }


class BackupResult {
  final bool success;
  final String? filePath;
  final String? errorMessage;

  const BackupResult.success(this.filePath)
      : success = true,
        errorMessage = null;

  const BackupResult.failure(this.errorMessage)
      : success = false,
        filePath = null;
}


class BackupService {
  BackupService._();

  static const String _prefBackupFolder = 'backup_folder_path';
  static const String _prefLastBackupAt = 'last_backup_at_iso';
  static const int _retentionCount = 30;
  static const Duration _autoBackupInterval = Duration(hours: 24);
  static const Duration _schedulerCheckInterval = Duration(minutes: 30);

  static Timer? _schedulerTimer;


  static Future<Directory> _defaultBackupDirectory() async {
    final docs = await getApplicationDocumentsDirectory();
    final dir = Directory(p.join(docs.path, 'BilliardHallBackups'));
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    return dir;
  }

  static Future<String> getConfiguredBackupFolder() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(_prefBackupFolder);
    if (saved != null && saved.isNotEmpty && await Directory(saved).exists()) {
      return saved;
    }
    return (await _defaultBackupDirectory()).path;
  }

  static Future<void> setBackupFolder(String folderPath) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefBackupFolder, folderPath);
  }

  static Future<DateTime?> getLastBackupTime() async {
    final prefs = await SharedPreferences.getInstance();
    final iso = prefs.getString(_prefLastBackupAt);
    return iso == null ? null : DateTime.tryParse(iso);
  }

  
  static Future<BackupResult> runBackupNow({
    required BackupTrigger trigger,
    String? overrideFolderPath, 
  }) async {
    try {
      if (!DatabaseConfig.isOpen) {
        return const BackupResult.failure('قاعدة البيانات غير مفتوحة حاليًا.');
      }

      final folderPath =
          overrideFolderPath ?? await getConfiguredBackupFolder();
      final folder = Directory(folderPath);
      if (!await folder.exists()) {
        await folder.create(recursive: true);
      }

      final timestamp = DateTime.now();
      final safeTimestamp =
          timestamp.toIso8601String().replaceAll(':', '-').split('.').first;
      final backupFileName = 'billiard_hall_backup_$safeTimestamp.isar';
      final backupFilePath = p.join(folderPath, backupFileName);

      await DatabaseConfig.instance.copyToFile(backupFilePath);

      final checksum = await _computeFileChecksum(backupFilePath);
      await File('$backupFilePath.sha256').writeAsString(checksum);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_prefLastBackupAt, timestamp.toIso8601String());

      if (trigger == BackupTrigger.automatic) {
        await _enforceRetention(folderPath);
      }

      return BackupResult.success(backupFilePath);
    } catch (e) {
      return BackupResult.failure('فشل إنشاء النسخة الاحتياطية: $e');
    }
  }

  static Future<String> _computeFileChecksum(String filePath) async {
    final bytes = await File(filePath).readAsBytes();
    return sha256.convert(bytes).toString();
  }

  
  static Future<void> _enforceRetention(String folderPath) async {
    final dir = Directory(folderPath);
    final backupFiles = dir
        .listSync()
        .whereType<File>()
        .where((f) => f.path.endsWith('.isar'))
        .toList()
      ..sort(
          (a, b) => a.statSync().modified.compareTo(b.statSync().modified));

    if (backupFiles.length <= _retentionCount) return;

    final filesToDelete =
        backupFiles.take(backupFiles.length - _retentionCount);
    for (final file in filesToDelete) {
      try {
        await file.delete();
        final checksumFile = File('${file.path}.sha256');
        if (await checksumFile.exists()) await checksumFile.delete();
      } catch (_) {
    
      }
    }
  }

  static Future<void> checkAndRunAutomaticBackupIfDue() async {
    final lastBackup = await getLastBackupTime();
    final isDue = lastBackup == null ||
        DateTime.now().difference(lastBackup) >= _autoBackupInterval;
    if (isDue) {
      await runBackupNow(trigger: BackupTrigger.automatic);
    }
  }


  static void startAutoBackupScheduler() {
    stopAutoBackupScheduler();
    unawaited(checkAndRunAutomaticBackupIfDue());
    _schedulerTimer = Timer.periodic(
      _schedulerCheckInterval,
      (_) => checkAndRunAutomaticBackupIfDue(),
    );
  }

  static void stopAutoBackupScheduler() {
    _schedulerTimer?.cancel();
    _schedulerTimer = null;
  }


  static Future<BackupResult> restoreFromFile(String backupFilePath) async {
    try {
      final backupFile = File(backupFilePath);
      if (!await backupFile.exists()) {
        return const BackupResult.failure('ملف النسخة الاحتياطية غير موجود.');
      }

   
      final checksumFile = File('$backupFilePath.sha256');
      if (await checksumFile.exists()) {
        final expected = (await checksumFile.readAsString()).trim();
        final actual = await _computeFileChecksum(backupFilePath);
        if (expected != actual) {
          return const BackupResult.failure(
            'ملف النسخة الاحتياطية تالف (فشل التحقق من سلامة الملف). '
            'تم إيقاف الاستعادة لتفادي فقدان بياناتك الحالية.',
          );
        }
      }

      await DatabaseConfig.close();

      final appDir = await getApplicationSupportDirectory();
      final liveDbPath =
          p.join(appDir.path, '${DatabaseConfig.databaseName}.isar');

     
      final safetyCopyPath = '$liveDbPath.before_restore';
      if (await File(liveDbPath).exists()) {
        await File(liveDbPath).copy(safetyCopyPath);
      }

      await backupFile.copy(liveDbPath);

    
      await DatabaseConfig.open();

      return const BackupResult.success(null);
    } catch (e) {
      return BackupResult.failure('فشلت عملية الاستعادة: $e');
    }
  }
}
