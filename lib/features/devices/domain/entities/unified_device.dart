import 'package:equatable/equatable.dart';

import '../../../sessions/domain/entities/active_session.dart';

enum DeviceKind { playstation, computer, table }

/// شغالة (عليها جلسة جارية) / شاغرة (متاحة) / معطلة (في الصيانة).
/// الجلسة الجارية لها الأولوية: جهاز عليه جلسة يظهر "شغال" حتى تنتهي.
enum DeviceStatus { active, idle, maintenance }

extension DeviceKindResource on DeviceKind {
  SessionResourceType get resourceType {
    switch (this) {
      case DeviceKind.playstation:
        return SessionResourceType.playstationDevice;
      case DeviceKind.computer:
        return SessionResourceType.cybercafeDevice;
      case DeviceKind.table:
        return SessionResourceType.billiardTable;
    }
  }
}

extension DeviceStatusLabel on DeviceStatus {
  String get arabicLabel {
    switch (this) {
      case DeviceStatus.active:
        return 'شغالة';
      case DeviceStatus.idle:
        return 'شاغرة';
      case DeviceStatus.maintenance:
        return 'معطلة';
    }
  }
}

/// عرض موحّد فوق الموارد الثلاثة (بلايستيشن/كمبيوتر/طاولة) دون تغيير نماذجها.
class UnifiedDevice extends Equatable {
  final DeviceKind kind;
  final int id;
  final String name;
  final String typeLabel;
  final DeviceStatus status;

  const UnifiedDevice({
    required this.kind,
    required this.id,
    required this.name,
    required this.typeLabel,
    required this.status,
  });

  @override
  List<Object?> get props => [kind, id, name, typeLabel, status];
}
