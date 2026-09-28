import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/playstation_device.dart';
import '../../domain/repositories/playstation_repository.dart';

class PlayStationState {
  final List<PlayStationDevice> devices;
  final bool isLoading;

  const PlayStationState({this.devices = const [], this.isLoading = true});
}

class PlayStationCubit extends Cubit<PlayStationState> {
  final PlayStationRepository _repository;
  StreamSubscription<List<PlayStationDevice>>? _subscription;

  PlayStationCubit(this._repository) : super(const PlayStationState()) {
    _subscription = _repository.watchAllDevices().listen((devices) {
      emit(PlayStationState(devices: devices, isLoading: false));
    });
  }

  Future<void> addDevice(PlayStationDevice device) =>
      _repository.addDevice(device);
  Future<void> updateDevice(PlayStationDevice device) =>
      _repository.updateDevice(device);
  Future<void> deactivateDevice(int id) => _repository.deactivateDevice(id);

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
