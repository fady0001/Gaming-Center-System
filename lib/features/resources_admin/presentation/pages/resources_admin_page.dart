import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/dimensions.dart';
import '../../../auth/presentation/cubit/auth_cubit.dart';
import '../../../auth/presentation/widgets/role_badge_action.dart';
import '../../../computers/presentation/cubit/computers_cubit.dart';
import '../../../playstation/domain/entities/playstation_device.dart';
import '../../../playstation/presentation/cubit/playstation_cubit.dart';
import '../../../tables/domain/entities/table_entity.dart';
import '../../../tables/presentation/cubit/tables_cubit.dart';
import '../widgets/computer_form_dialog.dart';
import '../widgets/playstation_form_dialog.dart';
import '../widgets/table_form_dialog.dart';

/// إدارة الأجهزة والتسعير (المدير فقط): طاولات + بلايستيشن، إضافة وتعديل
/// وإخفاء، مع سعر الساعة لكل واحد.
class ResourcesAdminPage extends StatelessWidget {
  const ResourcesAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isManager = context.watch<AuthCubit>().state.isManager;
    if (!isManager) {
      return Scaffold(
        appBar: AppBar(title: const Text('الأجهزة والتسعير')),
        body: const Center(child: Text('هذه الصفحة للمدير فقط.')),
      );
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('الأجهزة والتسعير'),
          actions: const [RoleBadgeAction()],
          bottom: const TabBar(tabs: [
            Tab(text: 'الطاولات'),
            Tab(text: 'البلايستيشن'),
            Tab(text: 'الكمبيوترات'),
          ]),
        ),
        body: const TabBarView(children: [_TablesTab(), _PlayStationTab(), _ComputersTab()]),
      ),
    );
  }
}

class _TablesTab extends StatelessWidget {
  const _TablesTab();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TablesCubit, TablesState>(
      builder: (context, state) {
        return ListView(
          padding: const EdgeInsets.all(Dimensions.spaceM),
          children: [
            ElevatedButton.icon(
              onPressed: () => TableFormDialog.show(context),
              icon: const Icon(Icons.add),
              label: const Text('إضافة طاولة'),
            ),
            const SizedBox(height: Dimensions.spaceS),
            if (state.tables.isEmpty && !state.isLoading)
              const Padding(
                padding: EdgeInsets.all(Dimensions.spaceL),
                child: Center(child: Text('لا توجد طاولات بعد.')),
              ),
            for (final t in state.tables)
              Card(
                child: ListTile(
                  title: Text(t.name),
                  subtitle: Text(
                      '${t.type.arabicLabel} — الساعة: ${t.defaultRate.ratePerHour.toDisplayString()}'),
                  trailing: _RowMenu(
                    onEdit: () => TableFormDialog.show(context, table: t),
                    onHide: () => _confirmHide(
                      context,
                      t.name,
                      () => context.read<TablesCubit>().deactivateTable(t.id),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class _PlayStationTab extends StatelessWidget {
  const _PlayStationTab();

  String _ratesSummary(PlayStationDevice d) {
    final parts = <String>[];
    for (var i = 0; i < d.hourlyRates.length; i++) {
      parts.add('${i + 1}ل: ${d.hourlyRates[i].toDisplayString()}');
    }
    return parts.join('  |  ');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayStationCubit, PlayStationState>(
      builder: (context, state) {
        return ListView(
          padding: const EdgeInsets.all(Dimensions.spaceM),
          children: [
            ElevatedButton.icon(
              onPressed: () => PlayStationFormDialog.show(context),
              icon: const Icon(Icons.add),
              label: const Text('إضافة جهاز بلايستيشن'),
            ),
            const SizedBox(height: Dimensions.spaceS),
            if (state.devices.isEmpty && !state.isLoading)
              const Padding(
                padding: EdgeInsets.all(Dimensions.spaceL),
                child: Center(child: Text('لا توجد أجهزة بلايستيشن بعد.')),
              ),
            for (final d in state.devices)
              Card(
                child: ListTile(
                  leading: const Icon(Icons.sports_esports_outlined),
                  title: Text(d.name),
                  subtitle: Text('الساعة — ${_ratesSummary(d)}'),
                  trailing: _RowMenu(
                    onEdit: () => PlayStationFormDialog.show(context, device: d),
                    onHide: () => _confirmHide(
                      context,
                      d.name,
                      () => context.read<PlayStationCubit>().deactivateDevice(d.id),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class _ComputersTab extends StatelessWidget {
  const _ComputersTab();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComputersCubit, ComputersState>(
      builder: (context, state) {
        return ListView(
          padding: const EdgeInsets.all(Dimensions.spaceM),
          children: [
            ElevatedButton.icon(
              onPressed: () => ComputerFormDialog.show(context),
              icon: const Icon(Icons.add),
              label: const Text('إضافة كمبيوتر'),
            ),
            const SizedBox(height: Dimensions.spaceS),
            if (state.devices.isEmpty && !state.isLoading)
              const Padding(
                padding: EdgeInsets.all(Dimensions.spaceL),
                child: Center(child: Text('لا توجد أجهزة كمبيوتر بعد.')),
              ),
            for (final d in state.devices)
              Card(
                child: ListTile(
                  leading: const Icon(Icons.computer_outlined),
                  title: Text(d.name),
                  subtitle: Text('الساعة: ${d.hourlyRate.toDisplayString()}'),
                  trailing: _RowMenu(
                    onEdit: () => ComputerFormDialog.show(context, device: d),
                    onHide: () => _confirmHide(
                      context,
                      d.name,
                      () => context.read<ComputersCubit>().deactivateDevice(d.id),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class _RowMenu extends StatelessWidget {
  final VoidCallback onEdit;
  final VoidCallback onHide;
  const _RowMenu({required this.onEdit, required this.onHide});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (v) => v == 'edit' ? onEdit() : onHide(),
      itemBuilder: (_) => const [
        PopupMenuItem(value: 'edit', child: Text('تعديل')),
        PopupMenuItem(value: 'hide', child: Text('إخفاء')),
      ],
    );
  }
}

void _confirmHide(BuildContext context, String name, VoidCallback onConfirm) {
  showDialog(
    context: context,
    builder: (dialogContext) => AlertDialog(
      title: const Text('إخفاء'),
      content: Text('هل تريد إخفاء "$name"؟ (لا يُحذف من السجلات القديمة)'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(dialogContext).pop(),
          child: const Text('إلغاء'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(dialogContext).pop();
            onConfirm();
          },
          child: const Text('إخفاء'),
        ),
      ],
    ),
  );
}
