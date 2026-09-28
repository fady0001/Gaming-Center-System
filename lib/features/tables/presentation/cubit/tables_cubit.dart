import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/table_entity.dart';
import '../../domain/repositories/table_repository.dart';

class TablesState {
  final List<TableEntity> tables;
  final bool isLoading;

  const TablesState({this.tables = const [], this.isLoading = true});

  TablesState copyWith({List<TableEntity>? tables, bool? isLoading}) {
    return TablesState(
      tables: tables ?? this.tables,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class TablesCubit extends Cubit<TablesState> {
  final TableRepository _repository;
  StreamSubscription<List<TableEntity>>? _subscription;

  TablesCubit(this._repository) : super(const TablesState()) {
    _subscription = _repository.watchAllTables().listen((tables) {
      emit(state.copyWith(tables: tables, isLoading: false));
    });
  }

  Future<void> addTable(TableEntity table) => _repository.addTable(table);
  Future<void> updateTable(TableEntity table) =>
      _repository.updateTable(table);
  Future<void> deactivateTable(int tableId) =>
      _repository.deactivateTable(tableId);

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
