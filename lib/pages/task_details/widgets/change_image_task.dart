import 'package:firebase_task_app/extension/extensions.dart';
import 'package:firebase_task_app/l10n/l10n.dart';
import 'package:firebase_task_app/models/models.dart';
import 'package:firebase_task_app/pages/widgets/widgets.dart';
import 'package:flutter/material.dart';

/// {@template ChangeImageTask}
/// TODO: Add description.
/// {@endtemplate}
class ChangeImageTask extends StatelessWidget {
  /// {@macro ChangeImageTask}
  const ChangeImageTask({
    required this.task,
    super.key,
  });

  ///
  final MTask task;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final l10n = context.l10n;

    return Column(
      children: [
        Center(
          child: Hero(
            tag: task.uid ?? '',
            child: GestureDetector(
              onTap: () => DialogImage(
                imageTask: task.photoUrl,
                tag: task.uid ?? '',
              ).show(context),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  task.photoUrl,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.broken_image,
                    size: 100,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: Text(
            l10n.taskDetailsPageAuthor(task.name),
            style: TextStyle(
              fontSize: 16,
              color: colors.onTertiary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
