import 'package:firebase_task_app/l10n/l10n.dart';
import 'package:firebase_task_app/pages/widgets/widgets.dart';
import 'package:flutter/material.dart';

/// {@template TaskStatesX}
/// TODO: Add description.
/// {@endtemplate}
extension TaskStatesX on TaskStates {
  Color get colors => switch (this) {
        TaskStates.pending => Colors.yellow,
        TaskStates.private => Colors.red,
        TaskStates.public => Colors.green,
      };

  String title(BuildContext context) {
    final l10n = context.l10n;

    return switch (this) {
      TaskStates.pending => l10n.commonPending,
      TaskStates.private => l10n.commonPrivate,
      TaskStates.public => l10n.commonPublic,
    };
  }
}
