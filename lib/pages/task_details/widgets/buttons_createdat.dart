import 'package:firebase_task_app/extension/extensions.dart';
import 'package:firebase_task_app/l10n/l10n.dart';
import 'package:firebase_task_app/models/models.dart';
import 'package:firebase_task_app/pages/home/bloc/bloc_home.dart';
import 'package:firebase_task_app/pages/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template ButtonsAndCreatedAt}
/// TODO: Add description.
/// {@endtemplate}
class ButtonsAndCreatedAt extends StatelessWidget {
  /// {@macro ButtonsAndCreatedAt}
  const ButtonsAndCreatedAt({
    required this.isOwner,
    required this.task,
    required this.state,
    required this.title,
    required this.description,
    required this.color,
    super.key,
  });

  ///
  final bool isOwner;

  ///
  final MTask task;

  ///
  final int state;

  ///
  final String title;

  ///
  final String description;

  ///
  final Color color;

  ///
  void _dialogConfirmationToSaveTask(BuildContext context) {
    final l10n = context.l10n;

    if (!isOwner) {
      return Navigator.pop(context);
    }
    final mtask = task.copyWith(
      title: title,
      description: description,
      state: state,
      color: color.colorHex,
    );

    showDialog<void>(
      context: context,
      builder: (_) => BlocProvider.value(
        value: context.read<BlocHome>(),
        child: DialogConfirmation(
          message: l10n.taskDetailsPageConfirmChanges,
          onPressed: () => context.read<BlocHome>().add(
                BlocHomeEventModifyTask(task: mtask),
              ),
        ),
      ),
    );
  }

  void _dialogConfirmationToDeleteTask(BuildContext context) {
    final l10n = context.l10n;

    showDialog<void>(
      context: context,
      builder: (_) => BlocProvider.value(
        value: context.read<BlocHome>(),
        child: DialogConfirmation(
          message: l10n.taskDetailsPageDeleteTask,
          onPressed: () => context.read<BlocHome>().add(
                BlocHomeEventDeleteTask(
                  taskId: task.uid ?? '',
                  state: state.taskState,
                ),
              ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final l10n = context.l10n;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              l10n.taskDetailsPageCreateAT(task.createdAt.formatDMY),
              style: const TextStyle(color: Colors.grey),
            ),
            Text(
              l10n.taskDetailsPageUpdateAT(task.updatedAt.formatDMY),
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: ButtonCustom(
                title: isOwner
                    ? l10n.taskDetailsPageButtonSaveChanges
                    : l10n.taskDetailsPageButtonBack,
                onPressed: () => _dialogConfirmationToSaveTask(context),
              ),
            ),
            if (isOwner)
              IconButton(
                iconSize: 36,
                onPressed: () => _dialogConfirmationToDeleteTask(context),
                icon: Icon(
                  Icons.delete,
                  color: colors.error,
                ),
              ),
          ],
        ),
      ],
    );
  }
}
