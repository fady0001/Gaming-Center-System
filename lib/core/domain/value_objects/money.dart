
class Money {

  final int minorUnits;

  const Money(this.minorUnits)
      : assert(minorUnits >= 0, 'لا يمكن أن يكون المبلغ سالبًا في هذا النوع');

  const Money.zero() : minorUnits = 0;

  factory Money.fromMajorAndMinor(int major, int minor) {
    return Money(major * 100 + minor);
  }

  Money operator +(Money other) => Money(minorUnits + other.minorUnits);

  Money operator -(Money other) {
    final result = minorUnits - other.minorUnits;
    if (result < 0) {
      throw ArgumentError(
        'ناتج الطرح سالب (${result / 100.0})؛ تحقق من منطق الحساب المستدعي.',
      );
    }
    return Money(result);
  }

  Money operator *(int quantity) => Money(minorUnits * quantity);

  bool operator >(Money other) => minorUnits > other.minorUnits;
  bool operator <(Money other) => minorUnits < other.minorUnits;
  bool operator >=(Money other) => minorUnits >= other.minorUnits;
  bool operator <=(Money other) => minorUnits <= other.minorUnits;

  @override
  bool operator ==(Object other) =>
      other is Money && other.minorUnits == minorUnits;

  @override
  int get hashCode => minorUnits.hashCode;


  String toDisplayString({String decimalSeparator = '.'}) {
    final major = minorUnits ~/ 100;
    final minor = (minorUnits % 100).toString().padLeft(2, '0');
    return '$major$decimalSeparator$minor';
  }

  @override
  String toString() => 'Money(${toDisplayString()})';
}
