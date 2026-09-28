import '../../../../core/domain/entities/billing_rate.dart';


enum TableType { billiards, pingPong, airHockey, foosball, other, cardTable }

extension TableTypeLabel on TableType {
  String get arabicLabel {
    switch (this) {
      case TableType.billiards:
        return 'بلياردو';
      case TableType.pingPong:
        return 'بينغ بونغ';
      case TableType.airHockey:
        return 'هوكي';
      case TableType.foosball:
        return 'فيشة';
      case TableType.cardTable:
        return 'طاولة ورق (شدة)';
      case TableType.other:
        return 'أخرى';
    }
  }
}

class TableEntity {
  final int id;
  final String name;
  final TableType type;
  final BillingRate defaultRate;


  final bool isActive;

  const TableEntity({
    required this.id,
    required this.name,
    required this.type,
    required this.defaultRate,
    this.isActive = true,
  });

  TableEntity copyWith({
    String? name,
    TableType? type,
    BillingRate? defaultRate,
    bool? isActive,
  }) {
    return TableEntity(
      id: id,
      name: name ?? this.name,
      type: type ?? this.type,
      defaultRate: defaultRate ?? this.defaultRate,
      isActive: isActive ?? this.isActive,
    );
  }
}
