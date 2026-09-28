import '../value_objects/money.dart';

class BillingRate {

  final Money ratePerHour;

  final int minimumChargeMinutes;

  final int roundingIncrementMinutes;

  const BillingRate({
    required this.ratePerHour,
    this.minimumChargeMinutes = 0,
    this.roundingIncrementMinutes = 1,
  }) : assert(minimumChargeMinutes >= 0),
       assert(roundingIncrementMinutes >= 1);
}
