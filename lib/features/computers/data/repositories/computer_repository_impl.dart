import 'package:isar/isar.dart';

import '../../domain/entities/computer_device.dart';
import '../../domain/repositories/computer_repository.dart';
import '../models/computer_device_model.dart';

class ComputerRepositoryImpl implements ComputerRepository {
  final Isar _isar;
  ComputerRepositoryImpl(this._isar);

  @override
  Stream<List<ComputerDevice>> watchAllDevices() {
    return _isar.computerDeviceModels
        .filter()
        .isActiveFlagEqualTo(true)
        .watch(fireImmediately: true)
        .map((models) => models.map((m) => m.toEntity()).toList());
  }

  @override
  Future<ComputerDevice> addDevice(ComputerDevice device) async {
    final model = ComputerDeviceModel.fromEntity(device);
    await _isar.writeTxn(() async {
      await _isar.computerDeviceModels.put(model);
    });
    return model.toEntity();
  }

  @override
  Future<ComputerDevice> updateDevice(ComputerDevice device) async {
    final model = ComputerDeviceModel.fromEntity(device);
    await _isar.writeTxn(() async {
      await _isar.computerDeviceModels.put(model);
    });
    return model.toEntity();
  }

  @override
  Future<void> deactivateDevice(int deviceId) async {
    await _isar.writeTxn(() async {
      final model = await _isar.computerDeviceModels.get(deviceId);
      if (model == null) return;
      model.isActiveFlag = false;
      await _isar.computerDeviceModels.put(model);
    });
  }
}
