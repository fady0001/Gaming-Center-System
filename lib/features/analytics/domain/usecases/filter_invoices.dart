import '../../../../core/utils/arabic_search.dart';
import '../../../carts/domain/entities/cart.dart';

/// بحث في الفواتير: برقم الفاتورة (`12` أو `#12`) أو باسم الزبون.
/// استعلام رقمي يطابق الرقم تمامًا أو اسمًا يحتوي الرقم.
List<Cart> filterInvoices(List<Cart> carts, String query) {
  final raw = query.trim();
  if (raw.isEmpty) return carts;

  final idQuery = int.tryParse(raw.startsWith('#') ? raw.substring(1) : raw);
  final q = normalizeForSearch(raw.startsWith('#') ? raw.substring(1) : raw);

  return carts.where((c) {
    if (idQuery != null && c.id == idQuery) return true;
    return normalizeForSearch(c.customerName).contains(q);
  }).toList();
}
