import 'package:isar/isar.dart';

import '../../domain/entities/table_entity.dart';
import '../../domain/repositories/table_repository.dart';
import '../models/table_model.dart';

class TableRepositoryImpl implements TableRepository {
  final Isar _isar;
  TableRepositoryImpl(this._isar);

  @override
  Stream<List<TableEntity>> watchAllTables() {
    return _isar.tableModels
        .filter()
        .isActiveFlagEqualTo(true)
        .watch(fireImmediately: true)
        .map((models) => models.map((m) => m.toEntity()).toList());
  }

  @override
  Future<TableEntity> addTable(TableEntity table) async {
    final model = TableModel.fromEntity(table);
    await _isar.writeTxn(() async {
      await _isar.tableModels.put(model);
    });
    return model.toEntity();
  }

  @override
  Future<TableEntity> updateTable(TableEntity table) async {
    final model = TableModel.fromEntity(table);
    await _isar.writeTxn(() async {
      await _isar.tableModels.put(model);
    });
    return model.toEntity();
  }

  @override
  Future<void> deactivateTable(int tableId) async {
    await _isar.writeTxn(() async {
      final model = await _isar.tableModels.get(tableId);
      if (model == null) return;
      model.isActiveFlag = false;
      await _isar.tableModels.put(model);
    });
  }
}
