import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_task_app/extension/extensions.dart';
import 'package:firebase_task_app/models/models.dart';
import 'package:firebase_task_app/pages/widgets/enums/enums.dart';
import 'package:firebase_task_app/services/services.dart';

part 'bloc_home_event.dart';
part 'bloc_home_state.dart';

/// {@template BlocHome}
/// TODO: Add description.
/// {@endtemplate}
class BlocHome extends Bloc<BlocHomeEvent, BlocHomeState> {
  /// {@macro BlocHome}
  BlocHome() : super(const BlocHomeInitial()) {
    on<BlocHomeEventGetTasksPublic>(_onGetTasksPublic);
    on<BlocHomeEventGetTasksPrivate>(_onGetTaskPrivate);

    on<BlocHomeEventAddNewTask>(_onAddNewTask);
    on<BlocHomeEventModifyTask>(_onModifyTask);
    on<BlocHomeEventDeleteTask>(_onRemoveTask);
  }
  final _taskServicesFirebase = TaskServicesFirebase();

  StreamSubscription<List<Map<String, dynamic>>>? _tasksPublicSubscription;

  StreamSubscription<List<Map<String, dynamic>>>? _taskPrivateSubscription;

  ///
  Future<void> _onGetTasksPublic(
    BlocHomeEventGetTasksPublic event,
    Emitter<BlocHomeState> emit,
  ) async {
    try {
      await _tasksPublicSubscription?.cancel();

      await emit.forEach<List<MTask>>(
        _taskServicesFirebase.streamTasksPublic('public_tasks'),
        onData: (tasks) =>
            BlocHomeStateSuccessTasksPublic.from(state, tasksPublic: tasks),
        onError: (_, __) => BlocHomeStateError.from(state, 'Algo salió mal'),
      );
    } catch (e) {
      if (!isClosed) {
        emit(BlocHomeStateError.from(state, e.toString()));
      }
    }
  }

  ///
  Future<void> _onGetTaskPrivate(
    BlocHomeEventGetTasksPrivate event,
    Emitter<BlocHomeState> emit,
  ) async {
    try {
      await _taskPrivateSubscription?.cancel();

      final user = FirebaseServices().currentUser;

      await emit.forEach<List<MTask>>(
        _taskServicesFirebase.streamTasksPublic('tasks/${user.uid}'),
        onData: (tasks) =>
            BlocHomeStateSuccessTasksPrivate.from(state, tasksPrivate: tasks),
        onError: (_, __) => BlocHomeStateError.from(state, 'Algo salió mal'),
      );
    } catch (e) {
      if (!isClosed) {
        emit(BlocHomeStateError.from(state, e.toString()));
      }
    }
  }

  ///
  Future<void> _onAddNewTask(
    BlocHomeEventAddNewTask event,
    Emitter<BlocHomeState> emit,
  ) async {
    try {
      emit(BlocHomeStateLoading.from(state));
      await _taskServicesFirebase.addTask(
        description: event.description ?? '',
        title: event.title ?? '',
        state: event.state ?? TaskStates.public,
        color: event.color ?? '#FFFFFF',
      );

      emit(BlocHomeStateSuccessToCreateTask.from(state));
    } catch (e) {
      emit(BlocHomeStateError.from(state, e.toString()));
    }
  }

  ///
  Future<void> _onRemoveTask(
    BlocHomeEventDeleteTask event,
    Emitter<BlocHomeState> emit,
  ) async {
    try {
      emit(BlocHomeStateLoading.from(state));
      await _taskServicesFirebase.deleteTask(
        taskId: event.taskId,
        state: event.state,
      );

      emit(BlocHomeStateSuccessToDeleteTask.from(state));
    } catch (e) {
      emit(BlocHomeStateError.from(state, e.toString()));
    }
  }

  ///
  Future<void> _onModifyTask(
    BlocHomeEventModifyTask event,
    Emitter<BlocHomeState> emit,
  ) async {
    try {
      emit(BlocHomeStateLoading.from(state));
      final oldTask = state.tasksPublic
              ?.firstWhereOrNull((t) => t.uid == event.task.uid) ??
          state.tasksPrivate?.firstWhereOrNull((t) => t.uid == event.task.uid);

      if (oldTask != null) {
        await _taskServicesFirebase.updateTask(
          newTask: event.task,
          oldTask: oldTask,
        );
        return emit(BlocHomeStateSuccessToModifyTask.from(state));
      }

      emit(BlocHomeStateError.from(state, 'Error'));
    } catch (e) {
      emit(BlocHomeStateError.from(state, e.toString()));
    }
  }

  @override
  Future<void> close() {
    _tasksPublicSubscription?.cancel();
    _taskPrivateSubscription?.cancel();
    return super.close();
  }
}
