import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_task_app/extension/extensions.dart';
import 'package:firebase_task_app/models/models.dart';
import 'package:firebase_task_app/pages/widgets/enums/enums.dart';
import 'package:firebase_task_app/services/services.dart';

/// {@template TaskServicesFirebase}
/// TODO: Add description.
/// {@endtemplate}
class TaskServicesFirebase {
  ///
  final _currentUser = FirebaseServices().currentUser;

  DatabaseReference _databaseRef({String? conection}) =>
      FirebaseDatabase.instance.ref(conection);

  Future<void> addTask({
    required String description,
    required String title,
    required TaskStates state,
    required String color,
  }) async {
    try {
      final task = MTask(
        name: _currentUser.displayName ?? 'Unknown',
        email: _currentUser.email ?? 'Unknown',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        description: description,
        title: title,
        photoUrl: _currentUser.photoURL ?? '',
        state: state.index,
        color: color,
        authorUid: _currentUser.uid,
      );

      final databaseRef = FirebaseDatabase.instance.ref();
      if (state == TaskStates.public) {
        await databaseRef.child('public_tasks').push().set(task.toJson());
      } else {
        await databaseRef
            .child('tasks/${_currentUser.uid}')
            .push()
            .set(task.toJson());
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateTask({
    required MTask newTask,
    required MTask oldTask,
  }) async {
    try {
      final oldIsPublic = oldTask.state.taskState == TaskStates.public;
      final newIsPublic = newTask.state.taskState == TaskStates.public;

      if (oldIsPublic != newIsPublic) {
        final oldPath = oldIsPublic
            ? 'public_tasks/${oldTask.uid}'
            : 'tasks/${_currentUser.uid}/${oldTask.uid}';

        await _databaseRef().child(oldPath).remove();

        final newPath = newIsPublic
            ? 'public_tasks/${newTask.uid}'
            : 'tasks/${_currentUser.uid}/${newTask.uid}';

        await _databaseRef().child(newPath).set(newTask.toJson());
      } else {
        final samePath = newIsPublic
            ? 'public_tasks/${newTask.uid}'
            : 'tasks/${_currentUser.uid}/${newTask.uid}';

        await _databaseRef().child(samePath).update(newTask.toJson());
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteTask({
    required String taskId,
    required TaskStates state,
  }) async {
    try {
      final taskPath = state == TaskStates.public
          ? 'public_tasks/$taskId'
          : 'tasks/${_currentUser.uid}/$taskId';

      await _databaseRef().child(taskPath).remove();
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<MTask>> streamTasksPublic(String conection) {
    return _databaseRef(conection: conection).onValue.map((event) {
      final data = event.snapshot.value as Map<Object?, Object?>?;

      if (data != null) {
        return data.entries.map((entry) {
          final user = entry.value! as Map<Object?, Object?>;
          final taskMap =
              user.map((key, value) => MapEntry(key! as String, value));

          return MTask.fromJson(taskMap).copyWith(uid: entry.key! as String);
        }).toList();
      } else {
        return [];
      }
    });
  }
}
