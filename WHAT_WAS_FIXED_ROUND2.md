# تصحيح إضافي: تعارض إصدارات test/bloc_test مع isar_generator

## الخطأ الذي ظهر
```
Because no versions of isar_generator match >3.1.0+1 <4.0.0 and isar_generator 3.1.0+1 depends on analyzer
  >=4.6.0 <6.0.0 ...
So, because ps4 depends on both isar_generator ^3.1.0+1 and test ^1.25.0, version solving failed.
```

## السبب
`isar_generator` (نسخة Isar v3 التي نستخدمها) يتطلب نسخة قديمة نسبيًا من
حزمة `analyzer` (أقل من 6.0.0). لكن حزمتي `test` و`bloc_test` الحديثتين
تتطلبان نسخة أحدث من `matcher`/`test_api`/`analyzer` لا تتوافق مع هذا
القيد القديم. هذا تعارض إصدارات حقيقي وليس خطأ في الكود، ولا يوجد له حل
"صحيح" غير التنازل عن أحد الطرفين حاليًا.

## الحل المطبَّق هنا
- حذفت `test: ^1.25.0` و`bloc_test: ^10.0.0` من `dev_dependencies` (لم
  نكن نستخدمهما فعليًا بعد في أي كود).
- أبقيت `mocktail` (لا علاقة له بهذا التعارض، مكتبة Mocking مستقلة).
- غيّرت استيراد ملف الاختبار الوحيد الموجود حاليًا من
  `package:test/test.dart` إلى `package:flutter_test/flutter_test.dart`
  (مرفقة أصلاً مع Flutter SDK ولا تدخل في هذا التعارض إطلاقًا، وتوفّر
  نفس الدوال `group`/`test`/`expect` بالضبط).

## كيف تُشغّل الاختبار الآن
بما أنه صار يستخدم `flutter_test`، شغّله بأمر Flutter بدل Dart المباشر:
```bash
flutter test
```
(وليس `dart test` كما ذكرت سابقًا بالخطأ — هذا تصحيح لتلك التعليمات).

## إن أردت مستقبلاً bloc_test/test الحديثتين فعليًا
الخيار الوحيد الصحيح وقتها هو الانتقال من `isar` (v3) إلى شوكة الصيانة
المجتمعية `isar_community` (تدعم إصدارات analyzer أحدث)، أو الانتظار حتى
يُحدَّث `isar_generator` نفسه. هذا قرار هندسي منفصل يستحق نقاشًا مخصصًا،
ولا داعي له الآن طالما لسنا نستخدم tests متقدمة تحتاج bloc_test فعليًا.
