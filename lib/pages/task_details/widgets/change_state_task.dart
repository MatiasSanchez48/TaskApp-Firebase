import 'package:firebase_task_app/extension/extensions.dart';
import 'package:firebase_task_app/l10n/l10n.dart';
import 'package:flutter/material.dart';

/// {@template ChangeStateTask}
/// TODO: Add description.
/// {@endtemplate}
class ChangeStateTask extends StatelessWidget {
  /// {@macro ChangeStateTask}
  const ChangeStateTask({
    required this.currentState,
    this.onPressed,
    super.key,
  });

  ///
  final int currentState;

  ///
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final l10n = context.l10n;

    return Row(
      children: [
        Text(
          l10n.taskDetailsPageState,
          style: const TextStyle(fontSize: 16),
        ),
        Tooltip(
          message: currentState.taskState.title(context).toUpperCase(),
          decoration: BoxDecoration(
            color: colors.surface,
            border: Border.all(
              color: colors.greyCustom,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: TextStyle(
            color: colors.onTertiary,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          child: CircleAvatar(
            backgroundColor: currentState.taskState.colors,
            radius: 5,
          ),
        ),
        const SizedBox(width: 5),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
          child: Text(
            currentState.taskState.title(context).toUpperCase(),
            key: ValueKey(currentState.taskState.name),
            style: TextStyle(
              letterSpacing: 1,
              color: colors.onTertiary,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const Spacer(),
        IconButton(
          iconSize: 26,
          onPressed: onPressed,
          icon: Icon(
            Icons.change_circle_outlined,
            color: colors.onTertiary,
          ),
        ),
      ],
    );
  }
}
