import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/invoice_config.dart';
import '../../../auth/presentation/cubit/auth_cubit.dart';
import '../../../carts/domain/entities/cart.dart';
import '../../../carts/presentation/cubit/carts_cubit.dart';
import 'invoice_preview_page.dart';

/// سجل الفواتير المغلقة (المدير فقط): الأحدث أولًا، والضغط على أي فاتورة
/// يفتح معاينتها لإعادة الطباعة.
class InvoicesHistoryPage extends StatefulWidget {
  const InvoicesHistoryPage({super.key});

  @override
  State<InvoicesHistoryPage> createState() => _InvoicesHistoryPageState();
}

class _InvoicesHistoryPageState extends State<InvoicesHistoryPage> {
  late Future<List<Cart>> _future;

  @override
  void initState() {
    super.initState();
    _future = context.read<CartsCubit>().closedCarts();
  }

  String _dateTime(DateTime t) {
    String two(int n) => n.toString().padLeft(2, '0');
    return '${t.year}/${two(t.month)}/${two(t.day)}  ${two(t.hour)}:${two(t.minute)}';
  }

  @override
  Widget build(BuildContext context) {
    final isManager = context.watch<AuthCubit>().state.isManager;
    if (!isManager) {
      return Scaffold(
        appBar: AppBar(title: const Text('سجل الفواتير')),
        body: const Center(child: Text('هذه الصفحة للمدير فقط.')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('سجل الفواتير')),
      body: FutureBuilder<List<Cart>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('تعذّر تحميل السجل: ${snapshot.error}'));
          }
          final carts = snapshot.data ?? const [];
          if (carts.isEmpty) {
            return const Center(child: Text('لا توجد فواتير بعد.'));
          }
          return ListView.separated(
            itemCount: carts.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, i) {
              final c = carts[i];
              return ListTile(
                leading: const Icon(Icons.receipt_long_outlined),
                title: Text('#${c.id} — ${c.customerName}'),
                subtitle: Text(_dateTime(c.closedAt ?? c.createdAt)),
                trailing: Text(
                    '${c.finalTotal?.toDisplayString() ?? '-'} ${InvoiceConfig.currencyLabel}'),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => InvoicePreviewPage(cart: c)),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
