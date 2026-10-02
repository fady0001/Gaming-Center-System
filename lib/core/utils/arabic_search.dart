/// توحيد النص العربي للبحث: يتجاهل التشكيل والتطويل ويوحّد الألف والياء
/// والتاء المربوطة، فيجد "أحمد" عند كتابة "احمد" و"مها" عند "مهة".
String normalizeForSearch(String input) {
  var s = input.trim().toLowerCase();
  s = s.replaceAll(RegExp('[\u064B-\u065F\u0670\u0640]'), '');
  s = s
      .replaceAll(RegExp('[أإآٱ]'), 'ا')
      .replaceAll('ى', 'ي')
      .replaceAll('ة', 'ه');
  return s;
}
