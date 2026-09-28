import 'package:isar/isar.dart';

import '../../domain/entities/playstation_device.dart';
import '../../domain/repositories/playstation_repository.dart';
import '../models/playstation_device_model.dart';

class PlayStationRepositoryImpl implements PlayStationRepository {
  final Isar _isar;
  PlayStationRepositoryImpl(this._isar);

  @override
  Stream<List<PlayStationDevice>> watchAllDevices() {
    return _isar.playStationDeviceModels
        .filter()
        .isActiveFlagEqualTo(true)
        .watch(fireImmediately: true)
        .map((models) => models.map((m) => m.toEntity()).toList());
  }

  @override
  Future<PlayStationDevice> addDevice(PlayStationDevice device) async {
    final model = PlayStationDeviceModel.fromEntity(device);
    await _isar.writeTxn(() async {
      await _isar.playStationDeviceModels.put(model);
    });
    return model.toEntity();
  }

  @override
  Future<PlayStationDevice> updateDevice(PlayStationDevice device) async {
    final model = PlayStationDeviceModel.fromEntity(device);
    await _isar.writeTxn(() async {
      await _isar.playStationDeviceModels.put(model);
    });
    return model.toEntity();
  }

  @override
  Future<void> deactivateDevice(int deviceId) async {
    await _isar.writeTxn(() async {
      final model = await _isar.playStationDeviceModels.get(deviceId);
      if (model == null) return;
      model.isActiveFlag = false;
      await _isar.playStationDeviceModels.put(model);
    });
  }
}
