import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/dimensions.dart';
import '../../../auth/presentation/widgets/role_badge_action.dart';
import '../../../auth/presentation/cubit/auth_cubit.dart';
import '../../../carts/presentation/pages/carts_page.dart';
import '../../../menu/presentation/pages/menu_page.dart';
import '../../../resources_admin/presentation/pages/resources_admin_page.dart';
import '../../../sessions/domain/entities/active_session.dart';
import '../../../sessions/presentation/cubit/active_sessions_cubit.dart';
import '../cubit/tables_cubit.dart';
import '../widgets/table_card.dart';
import '../widgets/table_session_sheet.dart';


class TablesGridPage extends StatelessWidget {
  const TablesGridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الطاولات'),
        actions: [
          IconButton(
            tooltip: 'سلال الزبائن',
            icon: const Icon(Icons.shopping_basket_outlined),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const CartsPage()),
            ),
          ),
          IconButton(
            tooltip: 'المنيو والمخزون',
            icon: const Icon(Icons.restaurant_menu_outlined),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const MenuPage()),
            ),
          ),
          if (context.watch<AuthCubit>().state.isManager)
            IconButton(
              tooltip: 'الأجهزة والتسعير',
              icon: const Icon(Icons.tune),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ResourcesAdminPage()),
              ),
            ),
          const RoleBadgeAction(),
        ],
      ),
      body: BlocBuilder<TablesCubit, TablesState>(
        builder: (context, tablesState) {
          if (tablesState.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (tablesState.tables.isEmpty) {
            return const Center(child: Text('لا توجد طاولات مُعرَّفة بعد.'));
          }

          return BlocBuilder<ActiveSessionsCubit, SessionsState>(
            builder: (context, sessionsState) {
              final columns = ResponsiveHelper.gridColumnsOf(context);
              return GridView.builder(
                padding: const EdgeInsets.all(Dimensions.spaceM),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  crossAxisSpacing: Dimensions.spaceM,
                  mainAxisSpacing: Dimensions.spaceM,
                  childAspectRatio: 1.1,
                ),
                itemCount: tablesState.tables.length,
                itemBuilder: (context, index) {
                  final table = tablesState.tables[index];
                  final ActiveSession? session =
                      sessionsState.sessionForResource(table.id);

                  return TableCard(
                    table: table,
                    activeSession: session,
                    now: sessionsState.now,
                    onTap: () => TableSessionSheet.show(
                      context,
                      table: table,
                      activeSession: session,
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
