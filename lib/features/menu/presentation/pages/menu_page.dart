import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/dimensions.dart';
import '../../../auth/presentation/cubit/auth_cubit.dart';
import '../../../auth/presentation/widgets/role_badge_action.dart';
import '../../domain/entities/menu_category.dart';
import '../cubit/menu_cubit.dart';
import '../widgets/menu_item_card.dart';
import '../widgets/menu_item_form_dialog.dart';

/// شاشة المنيو والمخزون: تبويب لكل تصنيف (مأكولات/مشروبات باردة/ساخنة/
/// أراكيل/أخرى). زر الإضافة يظهر للمدير فقط - الموظف يستعرض الأسعار
/// والكميات المتوفرة فقط (وسيختار منها لاحقًا عند بناء ميزة السلة).
class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isManager = context.watch<AuthCubit>().state.isManager;

    return DefaultTabController(
      length: MenuCategory.values.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('المنيو والمخزون'),
          actions: const [RoleBadgeAction()],
          bottom: TabBar(
            isScrollable: true,
            tabs: MenuCategory.values
                .map((category) => Tab(text: category.arabicLabel))
                .toList(),
          ),
        ),
        floatingActionButton: isManager
            ? FloatingActionButton.extended(
                onPressed: () => MenuItemFormDialog.show(context),
                icon: const Icon(Icons.add),
                label: const Text('إضافة صنف'),
              )
            : null,
        body: BlocBuilder<MenuCubit, MenuState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return TabBarView(
              children: MenuCategory.values.map((category) {
                final items = state.byCategory(category);
                if (items.isEmpty) {
                  return const Center(
                    child: Text('لا توجد أصناف بهذا التصنيف بعد.'),
                  );
                }
                return ListView.separated(
                  padding: const EdgeInsets.all(Dimensions.spaceM),
                  itemCount: items.length,
                  separatorBuilder: (_, __) =>
                      const SizedBox(height: Dimensions.spaceS),
                  itemBuilder: (context, index) =>
                      MenuItemCard(item: items[index]),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
