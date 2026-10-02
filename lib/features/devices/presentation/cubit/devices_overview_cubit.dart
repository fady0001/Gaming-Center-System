import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../computers/presentation/cubit/computers_cubit.dart';
import '../../../playstation/presentation/cubit/playstation_cubit.dart';
import '../../../sessions/presentation/cubit/active_sessions_cubit.dart';
import '../../../tables/presentation/cubit/tables_cubit.dart';
import '../../domain/entities/unified_device.dart';
import '../../domain/usecases/build_unified_devices.dart';

class DevicesOverviewState extends Equatable {
  final List<UnifiedDevice> devices;

  const DevicesOverviewState({this.devices = const []});

  int countOf(DeviceStatus status) =>
      devices.where((d) => d.status == status).length;

  List<UnifiedDevice> withStatus(DeviceStatus status) =>
      devices.where((d) => d.status == status).toList();

  @override
  List<Object?> get props => [devices];
}

/// يجمع حالة الأجهزة الثلاثة + الجلسات الجارية. ActiveSessionsCubit ينبض كل
/// ثانية، لكن الحالة هنا Equatable فلا يُعاد البناء إلا إذا تغيّر شيء فعلًا.
class DevicesOverviewCubit extends Cubit<DevicesOverviewState> {
  final PlayStationCubit _playstations;
  final ComputersCubit _computers;
  final TablesCubit _tables;
  final ActiveSessionsCubit _sessions;
  final List<StreamSubscription<dynamic>> _subscriptions = [];

  DevicesOverviewCubit(
    this._playstations,
    this._computers,
    this._tables,
    this._sessions,
  ) : super(const DevicesOverviewState()) {
    _recompute();
    _subscriptions.addAll([
      _playstations.stream.listen((_) => _recompute()),
      _computers.stream.listen((_) => _recompute()),
      _tables.stream.listen((_) => _recompute()),
      _sessions.stream.listen((_) => _recompute()),
    ]);
  }

  void _recompute() {
    emit(DevicesOverviewState(
      devices: buildUnifiedDevices(
        tables: _tables.state.tables,
        playstations: _playstations.state.devices,
        computers: _computers.state.devices,
        activeSessions: _sessions.state.activeSessions,
      ),
    ));
  }

  @override
  Future<void> close() {
    for (final s in _subscriptions) {
      s.cancel();
    }
    return super.close();
  }
}
