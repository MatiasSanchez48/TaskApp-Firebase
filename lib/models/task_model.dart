import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

/// {@template MTask}
/// TODO: Add description.
/// {@endtemplate}
@freezed
class MTask with _$MTask {
  /// {@macro MTask}
  const factory MTask({
    required String name,
    required String title,
    required String description,
    required String email,
    required String color,
    required String photoUrl,
    required DateTime createdAt,
    required DateTime updatedAt,
    required int state,
    required String authorUid,
    String? uid,
    DateTime? deletedAt,
  }) = _MTask;

  factory MTask.fromJson(Map<String, dynamic> json) => _$MTaskFromJson(json);
}
