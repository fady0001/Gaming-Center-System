import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/work_day.dart';
import '../../domain/repositories/work_day_repository.dart';
import '../../domain/usecases/start_new_day.dart';

class WorkDayState {
  final WorkDay? currentDay;
  final bool isRollingOver;

  const WorkDayState({this.currentDay, this.isRollingOver = false});

  WorkDayState copyWith({WorkDay? currentDay, bool? isRollingOver}) =>
      WorkDayState(
        currentDay: currentDay ?? this.currentDay,
        isRollingOver: isRollingOver ?? this.isRollingOver,
      );
}

class WorkDayCubit extends Cubit<WorkDayState> {
  final WorkDayRepository _repository;
  final StartNewDay _startNewDay;
  StreamSubscription<WorkDay>? _subscription;

  WorkDayCubit(this._repository, this._startNewDay)
      : super(const WorkDayState()) {
    _subscription = _repository.watchCurrentDay().listen(
          (day) => emit(state.copyWith(currentDay: day)),
        );
  }

  /// كل الأيام (المؤرشفة + الحالي) لعرض أسمائها في السجل.
  Future<List<WorkDay>> allDays() async {
    final archived = await _repository.archivedDays(limit: 5000);
    final current = await _repository.currentDay();
    return [current, ...archived];
  }

  /// يرمي الاستثناء كما هو ليعرض الـ UI رسالة مناسبة.
  Future<DayRollover> startNewDay() async {
    emit(state.copyWith(isRollingOver: true));
    try {
      return await _startNewDay();
    } finally {
      if (!isClosed) emit(state.copyWith(isRollingOver: false));
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
