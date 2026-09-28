import 'money.dart';


Money? parseMoney(String input) {
  final trimmed = input.trim();
  if (trimmed.isEmpty) return null;
  final parts = trimmed.split('.');
  if (parts.length > 2) return null;
  final major = int.tryParse(parts[0].isEmpty ? '0' : parts[0]);
  if (major == null || major < 0) return null;

  var minor = 0;
  if (parts.length == 2) {
    var minorStr = parts[1];
    if (minorStr.length > 2) minorStr = minorStr.substring(0, 2);
    minorStr = minorStr.padRight(2, '0');
    final parsed = int.tryParse(minorStr);
    if (parsed == null || parsed < 0) return null;
    minor = parsed;
  }
  return Money.fromMajorAndMinor(major, minor);
}
