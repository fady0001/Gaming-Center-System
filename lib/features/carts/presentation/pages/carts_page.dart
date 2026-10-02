import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/dimensions.dart';
import '../../../analytics/presentation/pages/analytics_page.dart';
import '../../../auth/presentation/cubit/auth_cubit.dart';
import '../../../auth/presentation/widgets/role_badge_action.dart';
import '../../../bookings/presentation/pages/bookings_page.dart';
import '../../../days/presentation/widgets/work_day_action.dart';
import '../../../devices/domain/entities/unified_device.dart';
import '../../../devices/presentation/cubit/devices_overview_cubit.dart';
import '../../../devices/presentation/widgets/device_status_bar.dart';
import '../../../invoicing/presentation/pages/invoices_history_page.dart';
import '../../domain/entities/cart.dart';
import '../../domain/usecases/filter_carts.dart';
import '../cubit/carts_cubit.dart';
import '../widgets/new_cart_dialog.dart';
import 'cart_detail_page.dart';

/// قائمة سلال الزبائن المفتوحة حاليًا (الأحدث أولًا) + شريط حالات الأجهزة
/// + بحث باسم الزبون + زر إنشاء سلة جديدة.
class CartsPage extends StatefulWidget {
  const CartsPage({super.key});

  @override
  State<CartsPage> createState() => _CartsPageState();
}

class _CartsPageState extends State<CartsPage> {
  DeviceStatus? _statusFilter;
  String _query = '';
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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
          IconButton(
            tooltip: 'الحجوزات',
            icon: const Icon(Icons.event_available_outlined),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const BookingsPage()),
            ),
          ),
          const WorkDayAction(),
          if (context.watch<AuthCubit>().state.isManager)
            IconButton(
              tooltip: 'الإحصائيات والتقارير',
              icon: const Icon(Icons.insights_outlined),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const AnalyticsPage()),
              ),
            ),
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              Dimensions.spaceM,
              Dimensions.spaceM,
              Dimensions.spaceM,
              Dimensions.spaceXS,
            ),
            child: DeviceStatusBar(
              selected: _statusFilter,
              onChanged: (v) => setState(() => _statusFilter = v),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.spaceM,
              vertical: Dimensions.spaceXS,
            ),
            child: TextField(
              controller: _searchController,
              onChanged: (v) => setState(() => _query = v),
              decoration: InputDecoration(
                hintText: 'بحث باسم الزبون',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _query.isEmpty
                    ? null
                    : IconButton(
                        tooltip: 'مسح',
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          _searchController.clear();
                          setState(() => _query = '');
                        },
                      ),
                border: const OutlineInputBorder(),
                isDense: true,
              ),
            ),
          ),
          Expanded(
            child: _statusFilter == DeviceStatus.maintenance
                ? const _MaintenanceDevicesList()
                : BlocBuilder<CartsCubit, CartsState>(
                    builder: (context, state) {
                      if (state.isLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (state.carts.isEmpty) {
                        return const Center(
                            child: Text('لا توجد سلال مفتوحة حاليًا.'));
                      }
                      final carts = filterCarts(
                        state.carts,
                        status: _statusFilter,
                        query: _query,
                      );
                      if (carts.isEmpty) {
                        return const Center(child: Text('لا توجد نتائج مطابقة.'));
                      }
                      return ListView.separated(
                        padding: const EdgeInsets.all(Dimensions.spaceM),
                        itemCount: carts.length,
                        separatorBuilder: (_, __) =>
                            const SizedBox(height: Dimensions.spaceS),
                        itemBuilder: (context, index) => _CartCard(
                          cart: carts[index],
                          onTap: () => _open(context, carts[index].id),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

/// تُعرض بدل السلال عند اختيار بطاقة "معطلة".
class _MaintenanceDevicesList extends StatelessWidget {
  const _MaintenanceDevicesList();

  @override
  Widget build(BuildContext context) {
    final devices = context
        .watch<DevicesOverviewCubit>()
        .state
        .withStatus(DeviceStatus.maintenance);
    if (devices.isEmpty) {
      return const Center(child: Text('لا توجد أجهزة معطلة.'));
    }
    return ListView.separated(
      padding: const EdgeInsets.all(Dimensions.spaceM),
      itemCount: devices.length,
      separatorBuilder: (_, __) => const SizedBox(height: Dimensions.spaceS),
      itemBuilder: (_, i) => Card(
        child: ListTile(
          leading: const Icon(Icons.build_circle_outlined),
          title: Text(devices[i].name),
          subtitle: Text('${devices[i].typeLabel} — تحت الصيانة'),
        ),
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
