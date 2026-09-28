import 'dart:io';
import 'package:crypto/crypto.dart';
import 'dart:convert';


class HardwareFingerprintService {

  static Future<String> computeFingerprint() async {
    final identifiers = <String>[];

    final machineGuid = await _readMachineGuid();
    if (machineGuid != null && machineGuid.isNotEmpty) {
      identifiers.add('guid:$machineGuid');
    }

    final boardSerial = await _readWmiValue(
      'Get-CimInstance Win32_BaseBoard | Select-Object -ExpandProperty SerialNumber',
    );
    if (_isUsableSerial(boardSerial)) {
      identifiers.add('board:$boardSerial');
    } else {
    
      final biosSerial = await _readWmiValue(
        'Get-CimInstance Win32_BIOS | Select-Object -ExpandProperty SerialNumber',
      );
      if (_isUsableSerial(biosSerial)) {
        identifiers.add('bios:$biosSerial');
      }
    }

    final mac = await _readPrimaryMacAddress();
    if (mac != null && mac.isNotEmpty) {
      identifiers.add('mac:$mac');
    }

    if (identifiers.isEmpty) {
      throw StateError(
        'تعذّر قراءة أي معرّف للجهاز. تأكد من تشغيل التطبيق بصلاحيات كافية.',
      );
    }


    identifiers.sort();
    final rawFingerprint = identifiers.join('|');
    final digest = sha256.convert(utf8.encode(rawFingerprint));
    return digest.toString();
  }

  static bool _isUsableSerial(String? serial) {
    if (serial == null) return false;
    final normalized = serial.trim().toLowerCase();
    if (normalized.isEmpty) return false;

    const placeholders = [
      'to be filled by o.e.m.',
      'default string',
      'none',
      'system serial number',
      '0000000000',
    ];
    return !placeholders.contains(normalized);
  }

 
  static Future<String?> _readMachineGuid() async {
    return _readWmiValue(
      "(Get-ItemProperty 'HKLM:\\SOFTWARE\\Microsoft\\Cryptography').MachineGuid",
    );
  }


  static Future<String?> _readWmiValue(String psCommand) async {
    try {
      final result = await Process.run(
        'powershell',
        ['-NoProfile', '-NonInteractive', '-Command', psCommand],
        runInShell: true,
      );
      if (result.exitCode != 0) return null;
      final output = (result.stdout as String).trim();
      return output.isEmpty ? null : output;
    } catch (e) {
      return null;
    }
  }


  static Future<String?> _readPrimaryMacAddress() async {
    try {
      final interfaces = await NetworkInterface.list(
        includeLinkLocal: true,
        type: InternetAddressType.any,
      );
      for (final iface in interfaces) {
        final name = iface.name.toLowerCase();
        final isVirtual = name.contains('virtual') ||
            name.contains('vmware') ||
            name.contains('vbox') ||
            name.contains('loopback') ||
            name.contains('bluetooth');
        if (isVirtual) continue;

      }
      return _readGetMacFallback();
    } catch (e) {
      return _readGetMacFallback();
    }
  }

  static Future<String?> _readGetMacFallback() async {
    return _readWmiValue(
      'Get-CimInstance Win32_NetworkAdapter | '
      "Where-Object { \$_.PhysicalAdapter -eq \$true -and \$_.MACAddress } | "
      'Select-Object -First 1 -ExpandProperty MACAddress',
    );
  }
}
