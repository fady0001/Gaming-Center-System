/// تنسيق مدة كـ hh:mm:ss (أرقام لاتينية واضحة للمراقبة من بعيد).
String formatDuration(Duration d) {
  final total = d.isNegative ? -d : d;
  final h = total.inHours.toString().padLeft(2, '0');
  final m = (total.inMinutes % 60).toString().padLeft(2, '0');
  final s = (total.inSeconds % 60).toString().padLeft(2, '0');
  return '$h:$m:$s';
}
