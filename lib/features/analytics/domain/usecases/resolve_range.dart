import '../entities/date_range.dart';

/// يحوّل اختيار المدير إلى فترة فعلية.
/// - day: من بداية يوم العمل الحالي [currentDayStart] (يتصفّر بعد "يوم جديد").
/// - week: من آخر سبت (بداية الأسبوع في سوريا) حتى نهاية اليوم.
/// - month: من أول الشهر حتى نهاية اليوم.
/// - custom: كما اختار (أو الشهر الحالي إن لم يُحدَّد).
DateRange resolveRange(
  RangeSelection selection, {
  required DateTime now,
  required DateTime currentDayStart,
}) {
  final today = DateTime(now.year, now.month, now.day);
  final tomorrow = today.add(const Duration(days: 1));

  switch (selection.preset) {
    case RangePreset.day:
      return DateRange(currentDayStart, tomorrow.isAfter(now) ? tomorrow : now);
    case RangePreset.week:
      // Dart: Monday=1 ... Saturday=6, Sunday=7  → أيام منذ السبت.
      final sinceSaturday = (now.weekday - DateTime.saturday) % 7;
      return DateRange(today.subtract(Duration(days: sinceSaturday)), tomorrow);
    case RangePreset.month:
      return DateRange(DateTime(now.year, now.month, 1), tomorrow);
    case RangePreset.custom:
      return selection.custom ?? DateRange(DateTime(now.year, now.month, 1), tomorrow);
  }
}
