import 'package:flutter_test/flutter_test.dart';
import 'package:ps4/core/domain/entities/billing_rate.dart';
import 'package:ps4/core/domain/usecases/calculate_session_charge.dart';
import 'package:ps4/core/domain/value_objects/money.dart';

void main() {
  final calculate = const CalculateSessionCharge();
  final start = DateTime(2026, 1, 1, 10, 0, 0);

  group('الحالة الأساسية (بدون حد أدنى وبدون تقريب)', () {
    test('ساعة كاملة بالضبط بسعر 10.00 لكل ساعة = 10.00', () {
      final rate = BillingRate(ratePerHour: Money.fromMajorAndMinor(10, 0));
      final result = calculate(
        startTime: start,
        endTime: start.add(const Duration(hours: 1)),
        rate: rate,
      );
      expect(result.amount, Money.fromMajorAndMinor(10, 0));
      expect(result.billedDuration, const Duration(hours: 1));
    });

    test('نصف ساعة بالضبط بسعر 10.00 لكل ساعة = 5.00', () {
      final rate = BillingRate(ratePerHour: Money.fromMajorAndMinor(10, 0));
      final result = calculate(
        startTime: start,
        endTime: start.add(const Duration(minutes: 30)),
        rate: rate,
      );
      expect(result.amount, Money.fromMajorAndMinor(5, 0));
    });

    test('90 دقيقة بسعر 10.00 لكل ساعة = 15.00', () {
      final rate = BillingRate(ratePerHour: Money.fromMajorAndMinor(10, 0));
      final result = calculate(
        startTime: start,
        endTime: start.add(const Duration(minutes: 90)),
        rate: rate,
      );
      expect(result.amount, Money.fromMajorAndMinor(15, 0));
    });

    test('سعر يحتوي كسورًا (7.50 لكل ساعة) لمدة 20 دقيقة = 2.50 بدون أي خطأ تقريب',
        () {
      final rate = BillingRate(ratePerHour: Money.fromMajorAndMinor(7, 50));
      final result = calculate(
        startTime: start,
        endTime: start.add(const Duration(minutes: 20)),
        rate: rate,
      );
      // 750 قرشًا × 1200 ثانية / 3600 = 250 قرشًا بالضبط
      expect(result.amount, Money(250));
    });
  });

  group('الحد الأدنى للفوترة (minimumChargeMinutes)', () {
    test('جلسة 3 دقائق مع حد أدنى 15 دقيقة تُحتسب كـ 15 دقيقة', () {
      final rate = BillingRate(
        ratePerHour: Money.fromMajorAndMinor(12, 0),
        minimumChargeMinutes: 15,
      );
      final result = calculate(
        startTime: start,
        endTime: start.add(const Duration(minutes: 3)),
        rate: rate,
      );
      expect(result.billedDuration, const Duration(minutes: 15));
      expect(result.actualDuration, const Duration(minutes: 3));
      // 12.00 / 4 (ربع ساعة) = 3.00
      expect(result.amount, Money.fromMajorAndMinor(3, 0));
    });

    test('جلسة أطول من الحد الأدنى تُحتسب بمدتها الفعلية وليس الحد الأدنى',
        () {
      final rate = BillingRate(
        ratePerHour: Money.fromMajorAndMinor(12, 0),
        minimumChargeMinutes: 15,
      );
      final result = calculate(
        startTime: start,
        endTime: start.add(const Duration(minutes: 40)),
        rate: rate,
      );
      expect(result.billedDuration, const Duration(minutes: 40));
    });
  });

  group('التقريب لأقرب وحدة (roundingIncrementMinutes)', () {
    test('16 دقيقة مع تقريب 15 دقيقة تصعد إلى 30 دقيقة', () {
      final rate = BillingRate(
        ratePerHour: Money.fromMajorAndMinor(10, 0),
        roundingIncrementMinutes: 15,
      );
      final result = calculate(
        startTime: start,
        endTime: start.add(const Duration(minutes: 16)),
        rate: rate,
      );
      expect(result.billedDuration, const Duration(minutes: 30));
    });

    test('15 دقيقة بالضبط مع تقريب 15 دقيقة تبقى 15 دقيقة (بدون تقريب زائد)',
        () {
      final rate = BillingRate(
        ratePerHour: Money.fromMajorAndMinor(10, 0),
        roundingIncrementMinutes: 15,
      );
      final result = calculate(
        startTime: start,
        endTime: start.add(const Duration(minutes: 15)),
        rate: rate,
      );
      expect(result.billedDuration, const Duration(minutes: 15));
    });

    test('ثانية واحدة فقط زيادة عن الوحدة تُقرَّب للوحدة التالية كاملة', () {
      final rate = BillingRate(
        ratePerHour: Money.fromMajorAndMinor(60, 0), // 1.00 لكل دقيقة
        roundingIncrementMinutes: 1,
      );
      final result = calculate(
        startTime: start,
        endTime: start.add(const Duration(minutes: 1, seconds: 1)),
        rate: rate,
      );
      expect(result.billedDuration, const Duration(minutes: 2));
      expect(result.amount, Money.fromMajorAndMinor(2, 0));
    });
  });

  group('الحالات الحدّية (Edge Cases)', () {
    test('جلسة بمدة صفر بدون حد أدنى تُحتسب بمبلغ صفر', () {
      final rate = BillingRate(ratePerHour: Money.fromMajorAndMinor(10, 0));
      final result = calculate(startTime: start, endTime: start, rate: rate);
      expect(result.amount, const Money.zero());
    });

    test('جلسة بمدة صفر مع حد أدنى مفعّل تُحتسب بالحد الأدنى (سلوك متعمّد)',
        () {
      final rate = BillingRate(
        ratePerHour: Money.fromMajorAndMinor(10, 0),
        minimumChargeMinutes: 15,
      );
      final result = calculate(startTime: start, endTime: start, rate: rate);
      expect(result.billedDuration, const Duration(minutes: 15));
    });

    test('وقت انتهاء قبل وقت البدء يرمي استثناءً بدل إرجاع مبلغ سالب', () {
      final rate = BillingRate(ratePerHour: Money.fromMajorAndMinor(10, 0));
      expect(
        () => calculate(
          startTime: start,
          endTime: start.subtract(const Duration(minutes: 1)),
          rate: rate,
        ),
        throwsArgumentError,
      );
    });

    test('جلسة طويلة جدًا (12 ساعة) لا تسبب أي فيضان أو خطأ في الحساب', () {
      final rate = BillingRate(ratePerHour: Money.fromMajorAndMinor(15, 0));
      final result = calculate(
        startTime: start,
        endTime: start.add(const Duration(hours: 12)),
        rate: rate,
      );
      expect(result.amount, Money.fromMajorAndMinor(180, 0));
    });
  });

  group('كائن Money نفسه', () {
    test('طرح مبلغ أكبر من الرصيد يرمي استثناءً بدل رقم سالب صامت', () {
      final a = Money.fromMajorAndMinor(5, 0);
      final b = Money.fromMajorAndMinor(10, 0);
      expect(() => a - b, throwsArgumentError);
    });

    test('toDisplayString لا يفقد الأصفار الزائدة عن اليمين', () {
      expect(Money(5).toDisplayString(), '0.05');
      expect(Money.fromMajorAndMinor(150, 5).toDisplayString(), '150.05');
    });
  });
}
