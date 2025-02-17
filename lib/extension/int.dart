import 'package:firebase_task_app/pages/widgets/widgets.dart';
/// {@template IntX}
/// TODO: Add description.
/// {@endtemplate}
extension IntX on int {
  TaskStates get taskState => switch (this) {
        0 => TaskStates.pending,
        1 => TaskStates.private,
        2 => TaskStates.public,
        _ => TaskStates.pending,
      };

  int get changeState => switch (this) {
        0 => 1,
        1 => 2,
        2 => 0,
        _ => 0,
      };
}
