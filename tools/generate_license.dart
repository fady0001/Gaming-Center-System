// ignore_for_file: avoid_print
import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';

/// أداة توليد ملفات الترخيص — للاستخدام من طرفك أنت (المطوّر/الدعم الفني)
/// فقط. لا يجوز إرفاق هذا الملف أو نشره مع تطبيق العميل بأي شكل، لأنه
/// يحتوي نفس المفتاح السرّي المستخدم في التحقق.
///
/// طريقة الاستخدام:
///   dart run tools/generate_license.dart <كود_الجهاز_المرسل_من_العميل>
///
/// الناتج: ملف license.lic في نفس المجلد، يُرسَل للعميل ليضعه في المسار
/// الذي تعرضه شاشة القفل داخل التطبيق.
void main(List<String> args) {
  if (args.isEmpty) {
    print('الاستخدام: dart run tools/generate_license.dart <كود_الجهاز>');
    exit(1);
  }

  final deviceFingerprint = args.first.trim();

  // *** يجب أن يكون هذا مطابقًا تمامًا للمفتاح السري في license_service.dart ***
  const secretParts = [
    'BHM-2026',
    '-x9K',
    'q2',
    'Lz7',
    '-SECRET',
  ];
  final secretKey = secretParts.join();

  final hmac = Hmac(sha256, utf8.encode(secretKey));
  final signature = hmac.convert(utf8.encode(deviceFingerprint)).toString();

  final licenseJson = jsonEncode({
    'fingerprint': deviceFingerprint,
    'signature': signature,
    'issuedAt': DateTime.now().toIso8601String(),
  });

  final outputFile = File('license.lic');
  outputFile.writeAsStringSync(licenseJson);

  print('تم إنشاء ملف الترخيص بنجاح: ${outputFile.absolute.path}');
  print('أرسل هذا الملف للعميل ليضعه في مسار ملف الترخيص داخل التطبيق.');
}
