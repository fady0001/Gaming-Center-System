/// يوم عمل واحد في الصالة. اليوم "مفتوح" طالما [endedAt] فارغ، وعند الضغط
/// على "إنشاء يوم جديد" يُغلق (يُؤرشف) ويُفتح يوم جديد. لا يُحذف أي شيء.
class WorkDay {
  final int id;
  final DateTime startedAt;
  final DateTime? endedAt;

  const WorkDay({
    required this.id,
    required this.startedAt,
    this.endedAt,
  });

  bool get isOpen => endedAt == null;

  static const Map<int, String> _arabicDayNames = {
    DateTime.monday: 'الاثنين',
    DateTime.tuesday: 'الثلاثاء',
    DateTime.wednesday: 'الأربعاء',
    DateTime.thursday: 'الخميس',
    DateTime.friday: 'الجمعة',
    DateTime.saturday: 'السبت',
    DateTime.sunday: 'الأحد',
  };

  String get dateKey {
    String two(int n) => n.toString().padLeft(2, '0');
    return '${startedAt.year}-${two(startedAt.month)}-${two(startedAt.day)}';
  }

  String get dayName => _arabicDayNames[startedAt.weekday]!;

  /// مثال: `2026-10-01 - الخميس`
  String get label => '$dateKey - $dayName';
}

/// نتيجة عملية إنشاء يوم جديد.
class DayRollover {
  final WorkDay archivedDay;
  final WorkDay newDay;
  final int settledCarts;

  const DayRollover({
    required this.archivedDay,
    required this.newDay,
    required this.settledCarts,
  });
}
