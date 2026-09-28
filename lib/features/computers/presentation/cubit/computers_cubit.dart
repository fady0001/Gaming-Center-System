import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/computer_device.dart';
import '../../domain/repositories/computer_repository.dart';

class ComputersState {
  final List<ComputerDevice> devices;
  final bool isLoading;

  const ComputersState({this.devices = const [], this.isLoading = true});
}

class ComputersCubit extends Cubit<ComputersState> {
  final ComputerRepository _repository;
  StreamSubscription<List<ComputerDevice>>? _subscription;

  ComputersCubit(this._repository) : super(const ComputersState()) {
    _subscription = _repository.watchAllDevices().listen((devices) {
      emit(ComputersState(devices: devices, isLoading: false));
    });
  }

  Future<void> addDevice(ComputerDevice device) =>
      _repository.addDevice(device);
  Future<void> updateDevice(ComputerDevice device) =>
      _repository.updateDevice(device);
  Future<void> deactivateDevice(int id) => _repository.deactivateDevice(id);

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
