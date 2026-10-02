import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/entities/billing_rate.dart';
import '../../../../core/theme/color_palette.dart';
import '../../../../core/theme/dimensions.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../computers/presentation/cubit/computers_cubit.dart';
import '../../../playstation/domain/entities/playstation_device.dart';
import '../../../playstation/presentation/cubit/playstation_cubit.dart';
import '../../../sessions/domain/entities/active_session.dart';
import '../../../sessions/presentation/cubit/active_sessions_cubit.dart';
import '../../../tables/presentation/cubit/tables_cubit.dart';
import '../cubit/carts_cubit.dart';

/// اختيار طاولة أو جهاز بلايستيشن فارغ + نوع الوقت (مفتوح/محدد) + عدد
/// اللاعبين (للبلايستيشن) وإضافته لسلة الزبون.
class AddPlayLineSheet extends StatefulWidget {
  final int cartId;
  const AddPlayLineSheet({super.key, required this.cartId});

  static Future<void> show(BuildContext context, int cartId) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => MultiBlocProvider(
        providers: [
          BlocProvider.value(value: context.read<CartsCubit>()),
          BlocProvider.value(value: context.read<TablesCubit>()),
          BlocProvider.value(value: context.read<PlayStationCubit>()),
          BlocProvider.value(value: context.read<ComputersCubit>()),
          BlocProvider.value(value: context.read<ActiveSessionsCubit>()),
        ],
        child: AddPlayLineSheet(cartId: cartId),
      ),
    );
  }

  @override
  State<AddPlayLineSheet> createState() => _AddPlayLineSheetState();
}

class _AddPlayLineSheetState extends State<AddPlayLineSheet> {
  bool _fixedTime = false;
  int _players = 1;
  final _minutesController = TextEditingController(text: '60');
  String? _error;
  bool _busy = false;

  @override
  void dispose() {
    _minutesController.dispose();
    super.dispose();
  }

  Future<void> _add({
    required SessionResourceType type,
    required int resourceId,
    required String name,
    required BillingRate rate,
    int? playerCount,
  }) async {
    int? minutes;
    if (_fixedTime) {
      minutes = int.tryParse(_minutesController.text.trim());
      if (minutes == null || minutes <= 0) {
        setState(() => _error = 'أدخل مدة صحيحة بالدقائق');
        return;
      }
    }
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      await context.read<CartsCubit>().addPlayLine(
            cartId: widget.cartId,
            resourceType: type,
            resourceId: resourceId,
            resourceName: name,
            rate: rate,
            playerCount: playerCount,
            plannedMinutes: minutes,
          );
      if (mounted) Navigator.of(context).pop();
    } catch (e) {
      setState(() {
        _busy = false;
        _error = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onSurface;
    final sessions = context.watch<ActiveSessionsCubit>().state;

    final freeTables = context
        .watch<TablesCubit>()
        .state
        .tables
        .where((t) =>
            !t.isUnderMaintenance &&
            sessions.sessionForResource(t.id) == null)
        .toList();
    final freeDevices = context
        .watch<PlayStationCubit>()
        .state
        .devices
        .where((d) =>
            !d.isUnderMaintenance &&
            sessions.sessionForResource(d.id,
                    type: SessionResourceType.playstationDevice) ==
                null)
        .toList();

    final freeComputers = context
        .watch<ComputersCubit>()
        .state
        .devices
        .where((d) =>
            !d.isUnderMaintenance &&
            sessions.sessionForResource(d.id,
                    type: SessionResourceType.cybercafeDevice) ==
                null)
        .toList();

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.75,
      builder: (context, scrollController) => Padding(
        padding: EdgeInsets.only(
          left: Dimensions.spaceL,
          right: Dimensions.spaceL,
          top: Dimensions.spaceL,
          bottom: MediaQuery.of(context).viewInsets.bottom + Dimensions.spaceL,
        ),
        child: ListView(
          controller: scrollController,
          children: [
            Text('إضافة لعبة', style: AppTextStyles.heading2(textColor)),
            const SizedBox(height: Dimensions.spaceM),
            SegmentedButton<bool>(
              segments: const [
                ButtonSegment(value: false, label: Text('وقت مفتوح')),
                ButtonSegment(value: true, label: Text('وقت محدد')),
              ],
              selected: {_fixedTime},
              onSelectionChanged: (s) => setState(() => _fixedTime = s.first),
            ),
            if (_fixedTime) ...[
              const SizedBox(height: Dimensions.spaceS),
              TextField(
                controller: _minutesController,
                textDirection: TextDirection.ltr,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'المدة بالدقائق'),
              ),
            ],
            if (_error != null) ...[
              const SizedBox(height: Dimensions.spaceS),
              Text(_error!, style: const TextStyle(color: ColorPalette.danger)),
            ],
            const SizedBox(height: Dimensions.spaceL),
            Text('بلايستيشن', style: AppTextStyles.heading3(textColor)),
            const SizedBox(height: Dimensions.spaceXS),
            SegmentedButton<int>(
              segments: [
                for (var n = 1; n <= PlayStationDevice.maxPlayers; n++)
                  ButtonSegment(value: n, label: Text('$n لاعب')),
              ],
              selected: {_players},
              onSelectionChanged: (s) => setState(() => _players = s.first),
            ),
            if (freeDevices.isEmpty)
              const Padding(
                padding: EdgeInsets.all(Dimensions.spaceM),
                child: Text('لا توجد أجهزة بلايستيشن فارغة.'),
              ),
            for (final d in freeDevices)
              ListTile(
                enabled: !_busy,
                leading: const Icon(Icons.sports_esports_outlined),
                title: Text(d.name),
                subtitle: Text(
                    'الساعة ($_players لاعب): ${d.rateFor(_players).ratePerHour.toDisplayString()}'),
                onTap: () => _add(
                  type: SessionResourceType.playstationDevice,
                  resourceId: d.id,
                  name: d.name,
                  rate: d.rateFor(_players),
                  playerCount: _players,
                ),
              ),
            const SizedBox(height: Dimensions.spaceL),
            Text('الكمبيوترات', style: AppTextStyles.heading3(textColor)),
            if (freeComputers.isEmpty)
              const Padding(
                padding: EdgeInsets.all(Dimensions.spaceM),
                child: Text('لا توجد كمبيوترات فارغة.'),
              ),
            for (final d in freeComputers)
              ListTile(
                enabled: !_busy,
                leading: const Icon(Icons.computer_outlined),
                title: Text(d.name),
                subtitle: Text('الساعة: ${d.hourlyRate.toDisplayString()}'),
                onTap: () => _add(
                  type: SessionResourceType.cybercafeDevice,
                  resourceId: d.id,
                  name: d.name,
                  rate: d.rate,
                ),
              ),
            const SizedBox(height: Dimensions.spaceL),
            Text('الطاولات', style: AppTextStyles.heading3(textColor)),
            if (freeTables.isEmpty)
              const Padding(
                padding: EdgeInsets.all(Dimensions.spaceM),
                child: Text('لا توجد طاولات فارغة.'),
              ),
            for (final t in freeTables)
              ListTile(
                enabled: !_busy,
                leading: const Icon(Icons.table_restaurant_outlined),
                title: Text(t.name),
                subtitle: Text(
                    'الساعة: ${t.defaultRate.ratePerHour.toDisplayString()}'),
                onTap: () => _add(
                  type: SessionResourceType.billiardTable,
                  resourceId: t.id,
                  name: t.name,
                  rate: t.defaultRate,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
