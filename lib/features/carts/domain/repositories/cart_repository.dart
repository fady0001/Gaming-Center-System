import '../../../../core/domain/entities/billing_rate.dart';
import '../../../sessions/domain/entities/active_session.dart';
import '../entities/cart.dart';

abstract class CartRepository {
  Stream<List<Cart>> watchOpenCarts();

  Future<List<Cart>> getOpenCarts();

  /// كل سلال يوم معيّن (مفتوحة ومغلقة)، الأحدث أولًا.
  Future<List<Cart>> getCartsByDay(int dayId);

  Future<Cart> createCart(String customerName);

  Future<void> addItem({
    required int cartId,
    required int menuItemId,
    required int quantity,
  });

  Future<void> removeItem(int itemLineId);

  Future<void> addPlayLine({
    required int cartId,
    required SessionResourceType resourceType,
    required int resourceId,
    required String resourceName,
    required BillingRate rate,
    int? playerCount,
    int? plannedMinutes,
  });

  Future<Cart> checkout(int cartId);

  Future<List<Cart>> getClosedCarts({int limit = 200});

  /// الفواتير المغلقة التي أُغلقت ضمن [start, end)، الأحدث أولًا.
  Future<List<Cart>> getClosedCartsBetween(DateTime start, DateTime end);
}
