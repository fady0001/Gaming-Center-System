/// تنبيه انتهاء مدة جلسة محددة الوقت.
class ExpiryAlert {
  final int cartId;
  final int playLineId;
  final String customerName;
  final String deviceName;
  final int plannedMinutes;

  /// الزمن المنقضي منذ بدء الجلسة لحظة الاكتشاف (قد يزيد عن المدة المحددة).
  final Duration elapsed;

  const ExpiryAlert({
    required this.cartId,
    required this.playLineId,
    required this.customerName,
    required this.deviceName,
    required this.plannedMinutes,
    required this.elapsed,
  });
}
