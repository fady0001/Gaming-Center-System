import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/usecases/calculate_session_charge.dart';
import '../../../../core/domain/value_objects/money.dart';
import '../../../../core/theme/color_palette.dart';
import '../../../../core/theme/dimensions.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../sessions/presentation/cubit/active_sessions_cubit.dart';
import '../../../invoicing/presentation/pages/invoice_preview_page.dart';
import '../../domain/entities/cart.dart';
import '../cubit/carts_cubit.dart';
import '../widgets/add_menu_item_sheet.dart';
import '../widgets/add_play_line_sheet.dart';
import '../widgets/format_helpers.dart';

/// تفاصيل سلة زبون: أسطر اللعب (بعدّاد حي) + أسطر المنيو + الإجمالي الحي،
/// ومنها يُضاف أي شيء جديد للسلة نفسها أو تُنهى السلة كاملة.
class CartDetailPage extends StatelessWidget {
  final int cartId;
  const CartDetailPage({super.key, required this.cartId});

  static const _calculateCharge = CalculateSessionCharge();

  Money _liveCharge(CartPlayLine line, SessionsState sessions) {
    if (line.finalCharge != null) return line.finalCharge!;
    for (final s in sessions.activeSessions) {
      if (s.id == line.sessionId) {
        final end = sessions.now.isBefore(s.startTime) ? s.startTime : sessions.now;
        return _calculateCharge(
                startTime: s.startTime, endTime: end, rate: s.rateSnapshot)
            .amount;
      }
    }
    return const Money.zero();
  }

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onSurface;

    return BlocBuilder<CartsCubit, CartsState>(
      builder: (context, cartsState) {
        final cart = cartsState.cartById(cartId);
        if (cart == null) {
          return const Scaffold(body: Center(child: Text('السلة غير موجودة أو أُغلقت.')));
        }

        return BlocBuilder<ActiveSessionsCubit, SessionsState>(
          builder: (context, sessions) {
            var playTotal = const Money.zero();
            for (final line in cart.playLines) {
              playTotal = playTotal + _liveCharge(line, sessions);
            }
            final grandTotal = playTotal + cart.itemsTotal;

            return Scaffold(
              appBar: AppBar(title: Text('سلة ${cart.customerName}')),
              body: ListView(
                padding: const EdgeInsets.all(Dimensions.spaceM),
                children: [
                  Text('اللعب', style: AppTextStyles.heading3(textColor)),
                  const SizedBox(height: Dimensions.spaceXS),
                  if (cart.playLines.isEmpty)
                    const Padding(
                      padding: EdgeInsets.all(Dimensions.spaceS),
                      child: Text('لم تُضف أي لعبة بعد.'),
                    ),
                  for (final line in cart.playLines)
                    _playLineTile(line, sessions),
                  const SizedBox(height: Dimensions.spaceM),
                  Text('المنيو', style: AppTextStyles.heading3(textColor)),
                  const SizedBox(height: Dimensions.spaceXS),
                  if (cart.items.isEmpty)
                    const Padding(
                      padding: EdgeInsets.all(Dimensions.spaceS),
                      child: Text('لم يُطلب شيء من المنيو بعد.'),
                    ),
                  for (final item in cart.items)
                    ListTile(
                      title: Text(item.name),
                      subtitle: Text(
                          '${item.quantity} × ${item.unitPrice.toDisplayString()}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(item.total.toDisplayString(),
                              style: AppTextStyles.bodyLarge(textColor)),
                          IconButton(
                            tooltip: 'حذف (يرجع للمخزون)',
                            icon: const Icon(Icons.delete_outline),
                            onPressed: () => _remove(context, item.id),
                          ),
                        ],
                      ),
                    ),
                  const Divider(height: Dimensions.spaceXL),
                  _totalRow('مبلغ اللعب (حتى الآن)', playTotal, textColor),
                  _totalRow('مبلغ المنيو', cart.itemsTotal, textColor),
                  const SizedBox(height: Dimensions.spaceXS),
                  _totalRow('الإجمالي', grandTotal, textColor, emphasize: true),
                  const SizedBox(height: Dimensions.spaceL),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () => AddPlayLineSheet.show(context, cart.id),
                          icon: const Icon(Icons.sports_esports_outlined),
                          label: const Text('إضافة لعبة'),
                        ),
                      ),
                      const SizedBox(width: Dimensions.spaceS),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () => AddMenuItemSheet.show(context, cart.id),
                          icon: const Icon(Icons.restaurant_menu_outlined),
                          label: const Text('إضافة من المنيو'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: Dimensions.spaceM),
                  SizedBox(
                    height: Dimensions.buttonHeight,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorPalette.primary),
                      onPressed: () => _checkout(context, cart),
                      icon: const Icon(Icons.point_of_sale, color: Colors.white),
                      label: Text('إنهاء السلة والحساب',
                          style: AppTextStyles.button(Colors.white)),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _playLineTile(CartPlayLine line, SessionsState sessions) {
    final elapsed = sessions.now.difference(line.startedAt);
    final safeElapsed = elapsed.isNegative ? Duration.zero : elapsed;

    String timeText;
    Color? timeColor;
    if (line.isSettled) {
      timeText = 'انتهت — ${line.billedMinutes ?? 0} دقيقة محتسبة';
    } else if (line.isOpenTime) {
      timeText = 'مفتوح — ${formatDuration(safeElapsed)}';
    } else {
      final remaining = Duration(minutes: line.plannedMinutes!) - safeElapsed;
      if (remaining.isNegative) {
        timeText = 'تجاوز المدة بـ ${formatDuration(remaining)}';
        timeColor = ColorPalette.sessionOverdue;
      } else {
        timeText = 'المتبقي ${formatDuration(remaining)} من ${line.plannedMinutes} د';
      }
    }

    return ListTile(
      leading: const Icon(Icons.sports_esports_outlined),
      title: Text(line.playerCount == null
          ? line.resourceName
          : '${line.resourceName} — ${line.playerCount} لاعب'),
      subtitle: Text(timeText, style: TextStyle(color: timeColor)),
      trailing: Text(_liveCharge(line, sessions).toDisplayString()),
    );
  }

  Widget _totalRow(String label, Money value, Color textColor,
      {bool emphasize = false}) {
    final style = emphasize
        ? AppTextStyles.heading3(textColor)
        : AppTextStyles.bodyMedium(textColor);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimensions.spaceXXS),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(label, style: style), Text(value.toDisplayString(), style: style)],
      ),
    );
  }

  Future<void> _remove(BuildContext context, int itemLineId) async {
    final messenger = ScaffoldMessenger.of(context);
    try {
      await context.read<CartsCubit>().removeItem(itemLineId);
    } catch (e) {
      messenger.showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  Future<void> _checkout(BuildContext context, Cart cart) async {
    final cubit = context.read<CartsCubit>();
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('إنهاء السلة'),
        content: const Text(
            'سيتم إيقاف كل جلسات اللعب وتثبيت الحساب. متابعة؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('إلغاء'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('إنهاء'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    try {
      final closed = await cubit.checkout(cart.id);
      // نغادر صفحة السلة ونفتح الفاتورة مباشرة للمعاينة والطباعة.
      navigator.pop();
      navigator.push(
        MaterialPageRoute(builder: (_) => InvoicePreviewPage(cart: closed)),
      );
    } catch (e) {
      messenger.showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
