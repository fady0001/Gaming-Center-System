import '../../../../core/domain/entities/billing_rate.dart';

/// ملاحظة: القيم تُخزَّن بالاسم (EnumType.name) فإضافة قيمة جديدة بآخر
/// القائمة آمنة تمامًا على البيانات القديمة.
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

/// إعداد طاولة واحدة (اسمها، نوعها، وسعرها الافتراضي). هذا الكيان يمثّل
/// "الطاولة نفسها" ولا علاقة له بالجلسات التي تُشغَّل عليها (تلك مسؤولية
/// ميزة sessions المشتركة).
class TableEntity {
  final int id;
  final String name;
  final TableType type;
  final BillingRate defaultRate;

  /// تعطيل بدل حذف: طاولة قد تُستبعد من الخدمة (تحتاج صيانة، أو أُزيلت من
  /// الصالة)، لكن حذفها فعليًا من قاعدة البيانات سيكسر أي سجل جلسات قديم
  /// يشير إليها في التقارير التاريخية. لذلك نُخفيها فقط عبر isActive=false.
  final bool isActive;

  /// في الصيانة: يبقى ظاهرًا في النظام لكن لا يمكن حجزه/تشغيله حتى تنتهي الصيانة.
  /// مختلف عن [isActive] (الإخفاء/الإزالة من الخدمة).
  final bool isUnderMaintenance;

  const TableEntity({
    required this.id,
    required this.name,
    required this.type,
    required this.defaultRate,
    this.isActive = true,
    this.isUnderMaintenance = false,
  });

  TableEntity copyWith({
    String? name,
    TableType? type,
    BillingRate? defaultRate,
    bool? isActive,
    bool? isUnderMaintenance,
  }) {
    return TableEntity(
      id: id,
      name: name ?? this.name,
      type: type ?? this.type,
      defaultRate: defaultRate ?? this.defaultRate,
      isActive: isActive ?? this.isActive,
      isUnderMaintenance: isUnderMaintenance ?? this.isUnderMaintenance,
    );
  }
}
