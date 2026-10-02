import '../../../computers/domain/entities/computer_device.dart';
import '../../../playstation/domain/entities/playstation_device.dart';
import '../../../sessions/domain/entities/active_session.dart';
import '../../../tables/domain/entities/table_entity.dart';
import '../entities/unified_device.dart';

List<UnifiedDevice> buildUnifiedDevices({
  required List<TableEntity> tables,
  required List<PlayStationDevice> playstations,
  required List<ComputerDevice> computers,
  required List<ActiveSession> activeSessions,
}) {
  final busy = <String>{
    for (final s in activeSessions.where((s) => s.isActive))
      '${s.resourceType.name}:${s.resourceId}',
  };

  DeviceStatus statusOf(
      SessionResourceType type, int id, bool underMaintenance) {
    if (busy.contains('${type.name}:$id')) return DeviceStatus.active;
    return underMaintenance ? DeviceStatus.maintenance : DeviceStatus.idle;
  }

  return [
    for (final p in playstations)
      UnifiedDevice(
        kind: DeviceKind.playstation,
        id: p.id,
        name: p.name,
        typeLabel: 'بلايستيشن',
        status: statusOf(
            SessionResourceType.playstationDevice, p.id, p.isUnderMaintenance),
      ),
    for (final c in computers)
      UnifiedDevice(
        kind: DeviceKind.computer,
        id: c.id,
        name: c.name,
        typeLabel: 'كمبيوتر',
        status: statusOf(
            SessionResourceType.cybercafeDevice, c.id, c.isUnderMaintenance),
      ),
    for (final t in tables)
      UnifiedDevice(
        kind: DeviceKind.table,
        id: t.id,
        name: t.name,
        typeLabel: t.type.arabicLabel,
        status: statusOf(
            SessionResourceType.billiardTable, t.id, t.isUnderMaintenance),
      ),
  ];
}
