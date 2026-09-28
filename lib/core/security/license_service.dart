import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'hardware_fingerprint_service.dart';


enum LicenseStatus {
  valid,
  missingLicenseFile,
  fingerprintMismatch,
  corruptLicenseFile,
}

class LicenseCheckResult {
  final LicenseStatus status;
  final String currentDeviceFingerprint;

  const LicenseCheckResult({
    required this.status,
    required this.currentDeviceFingerprint,
  });

  bool get isValid => status == LicenseStatus.valid;
}

class LicenseService {
 
  static const List<String> _secretParts = [
    'BHM-2026', // Billiard Hall Manager
    '-x9K',
    'q2',
    'Lz7',
    '-SECRET',
  ];

  static String get _secretKey => _secretParts.join();

  static const String _licenseFileName = 'license.lic';


  static Future<LicenseCheckResult> validate() async {
    final currentFingerprint =
        await HardwareFingerprintService.computeFingerprint();

    final file = await _licenseFile();
    if (!await file.exists()) {
      return LicenseCheckResult(
        status: LicenseStatus.missingLicenseFile,
        currentDeviceFingerprint: currentFingerprint,
      );
    }

    Map<String, dynamic> licenseData;
    try {
      final content = await file.readAsString();
      licenseData = jsonDecode(content) as Map<String, dynamic>;
    } catch (e) {
      return LicenseCheckResult(
        status: LicenseStatus.corruptLicenseFile,
        currentDeviceFingerprint: currentFingerprint,
      );
    }

    final storedFingerprint = licenseData['fingerprint'] as String?;
    final storedSignature = licenseData['signature'] as String?;

    if (storedFingerprint == null || storedSignature == null) {
      return LicenseCheckResult(
        status: LicenseStatus.corruptLicenseFile,
        currentDeviceFingerprint: currentFingerprint,
      );
    }

    final expectedSignature = _sign(storedFingerprint);
    final signatureIsAuthentic = expectedSignature == storedSignature;
    final fingerprintMatchesThisDevice =
        storedFingerprint == currentFingerprint;

    if (!signatureIsAuthentic) {
   
      return LicenseCheckResult(
        status: LicenseStatus.corruptLicenseFile,
        currentDeviceFingerprint: currentFingerprint,
      );
    }

    if (!fingerprintMatchesThisDevice) {
   
      return LicenseCheckResult(
        status: LicenseStatus.fingerprintMismatch,
        currentDeviceFingerprint: currentFingerprint,
      );
    }

    return LicenseCheckResult(
      status: LicenseStatus.valid,
      currentDeviceFingerprint: currentFingerprint,
    );
  }

  static String _sign(String fingerprint) {
    final hmac = Hmac(sha256, utf8.encode(_secretKey));
    return hmac.convert(utf8.encode(fingerprint)).toString();
  }


  static Future<File> _licenseFile() async {
    final dir = await getApplicationSupportDirectory();
    return File(p.join(dir.path, _licenseFileName));
  }


  static Future<String> licenseFilePath() async {
    final file = await _licenseFile();
    return file.path;
  }
}
