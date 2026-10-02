import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/invoice_config.dart';
import '../../../../core/domain/value_objects/money.dart';
import '../../../../core/theme/dimensions.dart';
import '../../../../core/utils/time_format.dart';
import '../../../analytics/domain/entities/date_range.dart';
import '../../../analytics/domain/usecases/filter_invoices.dart';
import '../../../analytics/domain/usecases/resolve_range.dart';
import '../../../analytics/presentation/widgets/range_selector.dart';
import '../../../auth/presentation/cubit/auth_cubit.dart';
import '../../../carts/domain/entities/cart.dart';
import '../../../carts/presentation/cubit/carts_cubit.dart';
import '../../../days/domain/entities/work_day.dart';
import '../../../days/presentation/cubit/work_day_cubit.dart';
import 'invoice_preview_page.dart';

/// سجل الفواتير والصندوق (المدير فقط): فلتر بالفترة، بحث برقم الفاتورة أو
/// اسم الزبون، ملخّص دخل لكل يوم عمل، والضغط على فاتورة يفتح تفاصيلها
/// (بنودها) ويتيح طباعتها.
class InvoicesHistoryPage extends StatefulWidget {
  const InvoicesHistoryPage({super.key});

  @override
  State<InvoicesHistoryPage> createState() => _InvoicesHistoryPageState();
}

class _LedgerData {
  final List<Cart> carts;
  final Map<int, WorkDay> days;
  const _LedgerData(this.carts, this.days);
}

class _InvoicesHistoryPageState extends State<InvoicesHistoryPage> {
  RangeSelection _selection = RangeSelection.today;
  String _query = '';
  final _search = TextEditingController();
  late Future<_LedgerData> _future;

  @override
  void initState() {
    super.initState();
    _reload();
  }

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  void _reload() {
    final now = DateTime.now();
    final dayCubit = context.read<WorkDayCubit>();
    final dayStart = dayCubit.state.currentDay?.startedAt ??
        DateTime(now.year, now.month, now.day);
    final range = resolveRange(_selection, now: now, currentDayStart: dayStart);
    final carts = context.read<CartsCubit>();
    _future = () async {
      final results = await Future.wait([
        carts.closedCartsBetween(range.start, range.end),
        dayCubit.allDays(),
      ]);
      return _LedgerData(
        results[0] as List<Cart>,
        {for (final d in results[1] as List<WorkDay>) d.id: d},
      );
    }();
  }

  String _dateTime(DateTime t) => '${formatDate(t)}  ${formatClock(t)}';

  @override
  Widget build(BuildContext context) {
    if (!context.watch<AuthCubit>().state.isManager) {
      return Scaffold(
        appBar: AppBar(title: const Text('سجل الفواتير والصندوق')),
        body: const Center(child: Text('هذه الصفحة للمدير فقط.')),
      );
    }

    final cur = InvoiceConfig.currencyLabel;

    return Scaffold(
      appBar: AppBar(
        title: const Text('سجل الفواتير والصندوق'),
        actions: [
          IconButton(
            tooltip: 'تحديث',
            icon: const Icon(Icons.refresh),
            onPressed: () => setState(_reload),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(Dimensions.spaceM),
            child: Row(
              children: [
                RangeSelector(
                  selection: _selection,
                  onChanged: (s) => setState(() {
                    _selection = s;
                    _reload();
                  }),
                ),
                const SizedBox(width: Dimensions.spaceM),
                Expanded(
                  child: TextField(
                    controller: _search,
                    onChanged: (v) => setState(() => _query = v),
                    decoration: InputDecoration(
                      hintText: 'بحث برقم الفاتورة أو اسم الزبون',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: _query.isEmpty
                          ? null
                          : IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                _search.clear();
                                setState(() => _query = '');
                              },
                            ),
                      border: const OutlineInputBorder(),
                      isDense: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<_LedgerData>(
              future: _future,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(
                      child: Text('تعذّر تحميل السجل: ${snapshot.error}'));
                }
                final data = snapshot.data!;
                final carts = filterInvoices(data.carts, _query);
                if (carts.isEmpty) {
                  return const Center(child: Text('لا توجد فواتير مطابقة.'));
                }

                // تجميع حسب يوم العمل مع الحفاظ على ترتيب الأحدث أولًا.
                final groups = <int?, List<Cart>>{};
                for (final c in carts) {
                  groups.putIfAbsent(c.dayId, () => []).add(c);
                }
                int sum(Iterable<Cart> l) =>
                    l.fold(0, (s, c) => s + (c.finalTotal?.minorUnits ?? 0));
                String money(int minor) =>
                    '${_fmt(minor)} $cur';

                final total = sum(carts);

                return ListView(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimensions.spaceM),
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(Dimensions.spaceM),
                        child: Wrap(
                          spacing: Dimensions.spaceXL,
                          runSpacing: Dimensions.spaceXS,
                          children: [
                            Text('إجمالي الإيراد: ${money(total)}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            Text('مجموع الصندوق: ${money(total)}'),
                            Text('عدد الفواتير: ${carts.length}'),
                          ],
                        ),
                      ),
                    ),
                    for (final entry in groups.entries) ...[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                            0, Dimensions.spaceM, 0, Dimensions.spaceXS),
                        child: Text(
                          '${data.days[entry.key]?.label ?? 'بدون يوم'}'
                          ' — ${entry.value.length} فاتورة'
                          ' — ${money(sum(entry.value))}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      for (final c in entry.value)
                        Card(
                          child: ListTile(
                            leading: const Icon(Icons.receipt_long_outlined),
                            title: Text('#${c.id} — ${c.customerName}'),
                            subtitle: Text(_dateTime(c.closedAt ?? c.createdAt)),
                            trailing: Text(
                                '${c.finalTotal?.toDisplayString() ?? '-'} $cur'),
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (_) => InvoicePreviewPage(cart: c)),
                            ),
                          ),
                        ),
                    ],
                    const SizedBox(height: Dimensions.spaceXL),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /// نفس تنسيق Money.toDisplayString لكن لمجموع بالوحدات الصغرى.
  String _fmt(int minorUnits) => Money(minorUnits).toDisplayString();
}
