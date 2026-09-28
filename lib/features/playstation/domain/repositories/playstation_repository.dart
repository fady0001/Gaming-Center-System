import '../entities/playstation_device.dart';

abstract class PlayStationRepository {
  Stream<List<PlayStationDevice>> watchAllDevices();
  Future<PlayStationDevice> addDevice(PlayStationDevice device);
  Future<PlayStationDevice> updateDevice(PlayStationDevice device);
  Future<void> deactivateDevice(int deviceId);
}
