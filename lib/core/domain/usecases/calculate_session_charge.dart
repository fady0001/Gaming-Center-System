import '../entities/billing_rate.dart';
import '../value_objects/money.dart';


class SessionChargeResult {

  final Duration actualDuration;


  final Duration billedDuration;

  final Money amount;

  const SessionChargeResult({
    required this.actualDuration,
    required this.billedDuration,
    required this.amount,
  });
}


class CalculateSessionCharge {
  const CalculateSessionCharge();

  SessionChargeResult call({
    required DateTime startTime,
    required DateTime endTime,
    required BillingRate rate,
  }) {
    if (endTime.isBefore(startTime)) {
      throw ArgumentError(
        'وقت الانتهاء ($endTime) قبل وقت البدء ($startTime). '
        'تحقق من مصدر هذه الأوقات قبل استدعاء الحساب.',
      );
    }

    final actualDuration = endTime.difference(startTime);
    final actualSeconds = actualDuration.inSeconds;


    final minimumSeconds = rate.minimumChargeMinutes * 60;
    var billedSeconds =
        actualSeconds > minimumSeconds ? actualSeconds : minimumSeconds;

    if (actualSeconds == 0 && rate.minimumChargeMinutes == 0) {
      billedSeconds = 0;
    }

 
    final incrementSeconds = rate.roundingIncrementMinutes * 60;
    if (billedSeconds > 0 && incrementSeconds > 0) {
      final units =
          (billedSeconds + incrementSeconds - 1) ~/ incrementSeconds; // ceil
      billedSeconds = units * incrementSeconds;
    }

 
    final rawTotal = billedSeconds * rate.ratePerHour.minorUnits;
    final amountMinorUnits = (rawTotal + 1800) ~/ 3600; // 1800 = 3600 / 2

    return SessionChargeResult(
      actualDuration: actualDuration,
      billedDuration: Duration(seconds: billedSeconds),
      amount: Money(amountMinorUnits),
    );
  }
}
