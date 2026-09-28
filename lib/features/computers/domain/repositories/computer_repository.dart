import '../entities/computer_device.dart';

abstract class ComputerRepository {
  Stream<List<ComputerDevice>> watchAllDevices();
  Future<ComputerDevice> addDevice(ComputerDevice device);
  Future<ComputerDevice> updateDevice(ComputerDevice device);
  Future<void> deactivateDevice(int deviceId);
}
