part of 'bloc_home.dart';

/// {@template BlocHomeState}
/// TODO: Add description.
/// {@endtemplate}

sealed class BlocHomeState extends Equatable {
  /// {@macro BlocHomeState}
  const BlocHomeState._({
    this.tasksPublic = const [],
    this.tasksPrivate = const [],
  });

  BlocHomeState.from(
    BlocHomeState state, {
    List<MTask>? tasksPublic,
    List<MTask>? tasksPrivate,
  }) : this._(
          tasksPublic: tasksPublic ?? state.tasksPublic,
          tasksPrivate: tasksPrivate ?? state.tasksPrivate,
        );

  ///
  final List<MTask>? tasksPublic;

  ///
  final List<MTask>? tasksPrivate;

  @override
  List<Object> get props => [
        tasksPublic ?? [],
        tasksPrivate ?? [],
      ];
}

/// {@template BlocHomeInitial}
/// TODO: Add description.
/// {@endtemplate}
final class BlocHomeInitial extends BlocHomeState {
  /// {@macro BlocHomeInitial}
  const BlocHomeInitial() : super._();
}

/// {@template BlocHomeStateLoading}
/// TODO: Add description.
/// {@endtemplate}
class BlocHomeStateLoading extends BlocHomeState {
  /// {@macro BlocHomeStateLoading}
  BlocHomeStateLoading.from(super.state) : super.from();
}

/// {@template BlocHomeStateSuccessTasksPublic}
/// TODO: Add description.
/// {@endtemplate}
class BlocHomeStateSuccessTasksPublic extends BlocHomeState {
  /// {@macro BlocHomeStateSuccessTasksPublic}
  BlocHomeStateSuccessTasksPublic.from(super.state, {super.tasksPublic})
      : super.from();
}

/// {@template BlocHomeStateSuccessTasksPrivate}
/// TODO: Add description.
/// {@endtemplate}
class BlocHomeStateSuccessTasksPrivate extends BlocHomeState {
  /// {@macro BlocHomeStateSuccessTasksPrivate}
  BlocHomeStateSuccessTasksPrivate.from(super.state, {super.tasksPrivate})
      : super.from();
}

/// {@template BlocHomeStateSuccessToCreateTask}
/// TODO: Add description.
/// {@endtemplate}
class BlocHomeStateSuccessToCreateTask extends BlocHomeState {
  /// {@macro BlocHomeStateSuccessToCreateTask}
  BlocHomeStateSuccessToCreateTask.from(super.state) : super.from();
}

/// {@template BlocHomeStateSuccessToModifyTask}
/// TODO: Add description.
/// {@endtemplate}
class BlocHomeStateSuccessToModifyTask extends BlocHomeState {
  /// {@macro BlocHomeStateSuccessToModifyTask}
  BlocHomeStateSuccessToModifyTask.from(super.state) : super.from();
}

/// {@template BlocHomeStateSuccessToDeleteTask}
/// TODO: Add description.
/// {@endtemplate}
class BlocHomeStateSuccessToDeleteTask extends BlocHomeState {
  /// {@macro BlocHomeStateSuccessToDeleteTask}
  BlocHomeStateSuccessToDeleteTask.from(super.state) : super.from();
}

/// {@template BlocHomeStateError}
/// TODO: Add description.
/// {@endtemplate}
class BlocHomeStateError extends BlocHomeState {
  /// {@macro BlocHomeStateError}
  BlocHomeStateError.from(super.state, this.message) : super.from();

  ///
  final String message;
}
