part of 'bloc_home.dart';

/// {@template BlocHomeEvent}
/// TODO: Add description.
/// {@endtemplate}

sealed class BlocHomeEvent extends Equatable {
/// {@macro BlocHomeEvent}
  const BlocHomeEvent();

  @override
  List<Object> get props => [];
}

/// {@template BlocHomeEventGetTasksPublic}
/// TODO: Add description.
/// {@endtemplate}
class BlocHomeEventGetTasksPublic extends BlocHomeEvent {}

/// {@template BlocHomeEventGetTasksPrivate}
/// TODO: Add description.
/// {@endtemplate}
class BlocHomeEventGetTasksPrivate extends BlocHomeEvent {}

/// {@template BlocHomeEventAddNewTask}
/// TODO: Add description.
/// {@endtemplate}
class BlocHomeEventAddNewTask extends BlocHomeEvent {
  /// {@macro BlocHomeEventAddNewTask}
  const BlocHomeEventAddNewTask({
    this.title,
    this.description,
    this.state,
    this.color,
  });

  ///
  final String? title;

  ///
  final String? description;

  ///
  final TaskStates? state;

  ///
  final String? color;
}

/// {@template BlocHomeEventModifyTask}
/// TODO: Add description.
/// {@endtemplate}
class BlocHomeEventModifyTask extends BlocHomeEvent {
  /// {@macro BlocHomeEventModifyTask}
  const BlocHomeEventModifyTask({
    required this.task,
  });

  ///
  final MTask task;
}

/// {@template BlocHomeEventDeleteTask}
/// TODO: Add description.
/// {@endtemplate}
class BlocHomeEventDeleteTask extends BlocHomeEvent {
  /// {@macro BlocHomeEventDeleteTask}
  const BlocHomeEventDeleteTask({
    required this.taskId,
    required this.state,
  });

  ///
  final String taskId;

  ///
  final TaskStates state;
}
