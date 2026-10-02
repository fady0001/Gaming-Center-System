/// فترة زمنية نصف مفتوحة: [start, end).
class DateRange {
  final DateTime start;
  final DateTime end;

  const DateRange(this.start, this.end);

  bool contains(DateTime t) => !t.isBefore(start) && t.isBefore(end);
}

/// يومي = يوم العمل الحالي (من آخر "إنشاء يوم جديد")، أسبوعي = منذ السبت،
/// شهري = منذ أول الشهر، مخصص = نطاق يحدده المدير.
enum RangePreset { day, week, month, custom }

extension RangePresetLabel on RangePreset {
  String get arabicLabel {
    switch (this) {
      case RangePreset.day:
        return 'يومي';
      case RangePreset.week:
        return 'أسبوعي';
      case RangePreset.month:
        return 'شهري';
      case RangePreset.custom:
        return 'نطاق مخصص';
    }
  }
}

class RangeSelection {
  final RangePreset preset;

  /// يُستخدم فقط عند [RangePreset.custom]. [end] هنا نصف مفتوح (بعد آخر يوم).
  final DateRange? custom;

  const RangeSelection(this.preset, {this.custom});

  static const RangeSelection today = RangeSelection(RangePreset.day);
}
