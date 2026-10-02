import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/invoice_config.dart';
import '../../../../core/theme/color_palette.dart';
import '../../../../core/theme/dimensions.dart';
import '../../../../core/utils/time_format.dart';
import '../../../auth/presentation/cubit/auth_cubit.dart';
import '../../../bookings/presentation/cubit/bookings_cubit.dart';
import '../../../carts/domain/entities/cart.dart';
import '../../../carts/presentation/cubit/carts_cubit.dart';
import '../../../days/presentation/cubit/work_day_cubit.dart';
import '../../domain/entities/date_range.dart';
import '../../domain/usecases/compute_kpis.dart';
import '../../domain/usecases/resolve_range.dart';
import '../widgets/kpi_card.dart';
import '../widgets/range_selector.dart';

/// لوحة الإحصائيات والتقارير (المدير فقط).
class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  RangeSelection _selection = RangeSelection.today;
  late DateRange _range;
  late Future<List<Cart>> _future;

  @override
  void initState() {
    super.initState();
    _reload();
  }

  void _reload() {
    final now = DateTime.now();
    final dayStart = context.read<WorkDayCubit>().state.currentDay?.startedAt ??
        DateTime(now.year, now.month, now.day);
    _range = resolveRange(_selection, now: now, currentDayStart: dayStart);
    _future = context.read<CartsCubit>().closedCartsBetween(_range.start, _range.end);
  }

  String get _rangeLabel {
    if (_selection.preset == RangePreset.day) {
      return context.read<WorkDayCubit>().state.currentDay?.label ?? 'اليوم';
    }
    final lastDay = _range.end.subtract(const Duration(days: 1));
    return '${formatDate(_range.start)}  →  ${formatDate(lastDay)}';
  }

  @override
  Widget build(BuildContext context) {
    if (!context.watch<AuthCubit>().state.isManager) {
      return Scaffold(
        appBar: AppBar(title: const Text('الإحصائيات والتقارير')),
        body: const Center(child: Text('هذه الصفحة للمدير فقط.')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('الإحصائيات والتقارير'),
        actions: [
          IconButton(
            tooltip: 'تحديث',
            icon: const Icon(Icons.refresh),
            onPressed: () => setState(_reload),
          ),
        ],
      ),
      // أي سلة تُحاسَب تغيّر قائمة السلال المفتوحة، فنعيد الحساب تلقائيًا.
      body: BlocListener<CartsCubit, CartsState>(
        listener: (context, _) => setState(_reload),
        child: ListView(
          padding: const EdgeInsets.all(Dimensions.spaceM),
          children: [
            RangeSelector(
              selection: _selection,
              onChanged: (s) => setState(() {
                _selection = s;
                _reload();
              }),
            ),
            const SizedBox(height: Dimensions.spaceS),
            Text(_rangeLabel, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: Dimensions.spaceM),
            FutureBuilder<List<Cart>>(
              future: _future,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Padding(
                    padding: EdgeInsets.all(Dimensions.spaceXL),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                if (snapshot.hasError) {
                  return Text('تعذّر تحميل البيانات: ${snapshot.error}');
                }
                final kpis = computeKpis(
                  closedCarts: snapshot.data ?? const [],
                  bookings: context.watch<BookingsCubit>().state.bookings,
                  now: DateTime.now(),
                );
                final cur = InvoiceConfig.currencyLabel;
                final cards = [
                  KpiCard(
                    icon: Icons.payments_outlined,
                    title: 'إجمالي الإيراد',
                    value: '${kpis.revenue.toDisplayString()} $cur',
                    subtitle:
                        'ألعاب ${kpis.playTotal.toDisplayString()} · مأكولات ${kpis.itemsTotal.toDisplayString()}',
                    color: ColorPalette.statusActive,
                  ),
                  KpiCard(
                    icon: Icons.account_balance_wallet_outlined,
                    title: 'مجموع الصندوق',
                    value: '${kpis.cashBox.toDisplayString()} $cur',
                    subtitle: 'كل المبالغ نقدية',
                    color: ColorPalette.primary,
                  ),
                  KpiCard(
                    icon: Icons.receipt_long_outlined,
                    title: 'السلال المكتملة',
                    value: '${kpis.completedCarts}',
                    color: ColorPalette.statusIdle,
                  ),
                  KpiCard(
                    icon: Icons.event_available_outlined,
                    title: 'الحجوزات النشطة',
                    value: '${kpis.activeReservations}',
                    subtitle: 'قادمة ولم تُلغَ',
                    color: ColorPalette.warning,
                  ),
                ];
                return LayoutBuilder(
                  builder: (context, c) => GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: c.maxWidth >= 1000 ? 4 : 2,
                    mainAxisSpacing: Dimensions.spaceM,
                    crossAxisSpacing: Dimensions.spaceM,
                    childAspectRatio: c.maxWidth >= 1000 ? 2.0 : 2.6,
                    children: cards,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
