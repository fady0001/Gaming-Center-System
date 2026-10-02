String _two(int n) => n.toString().padLeft(2, '0');

/// HH:mm (24 ساعة، أرقام لاتينية).
String formatClock(DateTime t) => '${_two(t.hour)}:${_two(t.minute)}';

/// yyyy-MM-dd
String formatDate(DateTime t) => '${t.year}-${_two(t.month)}-${_two(t.day)}';
