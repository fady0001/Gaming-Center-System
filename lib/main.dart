import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/alerts/alert_center.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_manager.dart';
import 'core/security/license_service.dart';
import 'core/security/license_lock_page.dart';
import 'core/database/database_config.dart';
import 'core/backup/backup_service.dart';
import 'core/backup/app_lifecycle_service.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'features/auth/presentation/pages/role_gate_page.dart';
import 'features/bookings/data/repositories/booking_repository_impl.dart';
import 'features/bookings/domain/repositories/booking_repository.dart';
import 'features/bookings/presentation/cubit/bookings_cubit.dart';
import 'features/bookings/presentation/widgets/booking_reminder_host.dart';
import 'features/carts/data/repositories/cart_repository_impl.dart';
import 'features/carts/domain/repositories/cart_repository.dart';
import 'features/carts/presentation/cubit/carts_cubit.dart';
import 'features/computers/data/repositories/computer_repository_impl.dart';
import 'features/computers/domain/repositories/computer_repository.dart';
import 'features/computers/presentation/cubit/computers_cubit.dart';
import 'features/days/data/repositories/work_day_repository_impl.dart';
import 'features/devices/presentation/cubit/devices_overview_cubit.dart';
import 'features/days/domain/repositories/work_day_repository.dart';
import 'features/days/domain/usecases/start_new_day.dart';
import 'features/days/presentation/cubit/work_day_cubit.dart';
import 'features/menu/data/repositories/menu_repository_impl.dart';
import 'features/menu/domain/repositories/menu_repository.dart';
import 'features/menu/presentation/cubit/menu_cubit.dart';
import 'features/playstation/data/repositories/playstation_repository_impl.dart';
import 'features/playstation/domain/repositories/playstation_repository.dart';
import 'features/playstation/presentation/cubit/playstation_cubit.dart';
import 'features/sessions/data/repositories/session_repository_impl.dart';
import 'features/timers/data/expiry_alert_notifier.dart';
import 'features/timers/presentation/widgets/expiry_alert_host.dart';
import 'features/sessions/domain/repositories/session_repository.dart';
import 'features/sessions/presentation/cubit/active_sessions_cubit.dart';
import 'features/tables/data/repositories/table_repository_impl.dart';
import 'features/tables/domain/repositories/table_repository.dart';
import 'features/tables/presentation/cubit/tables_cubit.dart';
import 'features/tables/presentation/pages/tables_grid_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  final licenseResult = await LicenseService.validate();
  final licensePath = await LicenseService.licenseFilePath();

  SessionRepository? sessionRepository;
  TableRepository? tableRepository;
  MenuRepository? menuRepository;
  CartRepository? cartRepository;
  PlayStationRepository? playStationRepository;
  ComputerRepository? computerRepository;
  WorkDayRepository? workDayRepository;
  BookingRepository? bookingRepository;

  if (licenseResult.isValid) {

    final isar = await DatabaseConfig.open();


    sessionRepository = SessionRepositoryImpl(isar);
    tableRepository = TableRepositoryImpl(isar);
    menuRepository = MenuRepositoryImpl(isar);
    cartRepository = CartRepositoryImpl(isar, sessionRepository);
    playStationRepository = PlayStationRepositoryImpl(isar);
    computerRepository = ComputerRepositoryImpl(isar);
    workDayRepository = WorkDayRepositoryImpl(isar);
    bookingRepository = BookingRepositoryImpl(isar);

  
    await AppLifecycleService.instance.initialize();
    await ExpiryAlertNotifier.instance.init();


    BackupService.startAutoBackupScheduler();
  }

  runApp(BilliardHallApp(
    licenseResult: licenseResult,
    licensePath: licensePath,
    sessionRepository: sessionRepository,
    tableRepository: tableRepository,
    menuRepository: menuRepository,
    cartRepository: cartRepository,
    playStationRepository: playStationRepository,
    computerRepository: computerRepository,
    workDayRepository: workDayRepository,
    bookingRepository: bookingRepository,
  ));
}

class BilliardHallApp extends StatelessWidget {
  final LicenseCheckResult licenseResult;
  final String licensePath;
  final SessionRepository? sessionRepository;
  final TableRepository? tableRepository;
  final MenuRepository? menuRepository;
  final CartRepository? cartRepository;
  final PlayStationRepository? playStationRepository;
  final ComputerRepository? computerRepository;
  final WorkDayRepository? workDayRepository;
  final BookingRepository? bookingRepository;

  const BilliardHallApp({
    super.key,
    required this.licenseResult,
    required this.licensePath,
    required this.sessionRepository,
    required this.tableRepository,
    required this.menuRepository,
    required this.cartRepository,
    required this.playStationRepository,
    required this.computerRepository,
    required this.workDayRepository,
    required this.bookingRepository,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
       
        BlocProvider(create: (_) => AuthCubit()),

        if (licenseResult.isValid) ...[
          BlocProvider(create: (_) => ActiveSessionsCubit(sessionRepository!)),
          BlocProvider(create: (_) => TablesCubit(tableRepository!)),
          BlocProvider(create: (_) => MenuCubit(menuRepository!)),
          BlocProvider(create: (_) => CartsCubit(cartRepository!)),
          BlocProvider(create: (_) => PlayStationCubit(playStationRepository!)),
          BlocProvider(create: (_) => ComputersCubit(computerRepository!)),
          BlocProvider(
            create: (ctx) => DevicesOverviewCubit(
              ctx.read<PlayStationCubit>(),
              ctx.read<ComputersCubit>(),
              ctx.read<TablesCubit>(),
              ctx.read<ActiveSessionsCubit>(),
            ),
          ),
          BlocProvider(create: (_) => BookingsCubit(bookingRepository!)),
          BlocProvider(
            create: (_) => WorkDayCubit(
              workDayRepository!,
              StartNewDay(cartRepository!, workDayRepository!),
            ),
          ),
        ],
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            title: 'إدارة صالة الألعاب والبلياردو',
            debugShowCheckedModeBanner: false,

            locale: const Locale('ar'),
            supportedLocales: const [Locale('ar')],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            builder: (context, child) {
           
              final content = child ?? const SizedBox.shrink();
              // المراقبون يحتاجون الـ Cubits، فلا يعملون عند قفل الترخيص.
              return Directionality(
                textDirection: TextDirection.rtl,
                child: licenseResult.isValid
                    ? ExpiryAlertHost(
                        child: BookingReminderHost(
                          child: AlertOverlay(child: content),
                        ),
                      )
                    : content,
              );
            },

            themeMode: themeMode,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,

            home: licenseResult.isValid
                ? BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, authState) {
              
                      if (!authState.roleSelected) {
                        return const RoleGatePage();
                      }
                      return const TablesGridPage();
                    },
                  )
                : LicenseLockPage(
                    result: licenseResult,
                    licenseFilePath: licensePath,
                  ),
          );
        },
      ),
    );
  }
}
