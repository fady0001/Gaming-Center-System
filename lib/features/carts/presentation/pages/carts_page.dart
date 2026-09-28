import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/dimensions.dart';
import '../../../auth/presentation/cubit/auth_cubit.dart';
import '../../../auth/presentation/widgets/role_badge_action.dart';
import '../../../invoicing/presentation/pages/invoices_history_page.dart';
import '../../domain/entities/cart.dart';
import '../cubit/carts_cubit.dart';
import '../widgets/new_cart_dialog.dart';
import 'cart_detail_page.dart';

/// قائمة سلال الزبائن المفتوحة حاليًا + زر إنشاء سلة جديدة.
class CartsPage extends StatelessWidget {
  const CartsPage({super.key});

  void _open(BuildContext context, int cartId) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => CartDetailPage(cartId: cartId)),
    );
  }

  Future<void> _create(BuildContext context) async {
    final name = await askCustomerName(context);
    if (name == null || !context.mounted) return;
    final cart = await context.read<CartsCubit>().createCart(name);
    if (context.mounted) _open(context, cart.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('سلال الزبائن'),
        actions: [
          if (context.watch<AuthCubit>().state.isManager)
            IconButton(
              tooltip: 'سجل الفواتير',
              icon: const Icon(Icons.receipt_long_outlined),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const InvoicesHistoryPage()),
              ),
            ),
          const RoleBadgeAction(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _create(context),
        icon: const Icon(Icons.add_shopping_cart),
        label: const Text('سلة جديدة'),
      ),
      body: BlocBuilder<CartsCubit, CartsState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.carts.isEmpty) {
            return const Center(child: Text('لا توجد سلال مفتوحة حاليًا.'));
          }
          return ListView.separated(
            padding: const EdgeInsets.all(Dimensions.spaceM),
            itemCount: state.carts.length,
            separatorBuilder: (_, __) => const SizedBox(height: Dimensions.spaceS),
            itemBuilder: (context, index) => _CartCard(
              cart: state.carts[index],
              onTap: () => _open(context, state.carts[index].id),
            ),
          );
        },
      ),
    );
  }
}

class _CartCard extends StatelessWidget {
  final Cart cart;
  final VoidCallback onTap;
  const _CartCard({required this.cart, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final activePlay = cart.playLines.where((l) => !l.isSettled).length;
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: const Icon(Icons.shopping_basket_outlined),
        title: Text(cart.customerName),
        subtitle: Text('ألعاب جارية: $activePlay — أصناف منيو: ${cart.items.length}'),
        trailing: const Icon(Icons.chevron_left),
      ),
    );
  }
}
