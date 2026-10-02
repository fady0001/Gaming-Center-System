import '../entities/table_entity.dart';

abstract class TableRepository {
  Stream<List<TableEntity>> watchAllTables();
  Future<TableEntity> addTable(TableEntity table);
  Future<TableEntity> updateTable(TableEntity table);

  /// تعطيل بدل حذف فعلي (راجع التعليق في table_entity.dart لسبب هذا القرار).
  Future<void> deactivateTable(int tableId);
}
