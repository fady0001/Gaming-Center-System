import '../entities/table_entity.dart';

abstract class TableRepository {
  Stream<List<TableEntity>> watchAllTables();
  Future<TableEntity> addTable(TableEntity table);
  Future<TableEntity> updateTable(TableEntity table);

  Future<void> deactivateTable(int tableId);
}
