import 'package:firebase_task_app/app/router/router.dart';
import 'package:firebase_task_app/extension/extensions.dart';
import 'package:firebase_task_app/models/models.dart';
import 'package:firebase_task_app/pages/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// {@template TaskCard}
/// TODO: Add description.
/// {@endtemplate}
class TaskCard extends StatelessWidget {
  /// {@macro TaskCard}
  const TaskCard({
    required this.task,
    super.key,
  });

  ///
  final MTask task;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;

    return InkWell(
      onTap: () => context.go(GoRouterCustom().taskDetails, extra: task),
      child: Card(
        color: colors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: task.color.toColorTask, width: 3),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Hero(
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
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.broken_image,
                        size: 60,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            task.title.capitalize,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Tooltip(
                          message:
                              task.state.taskState.title(context).toUpperCase(),
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
                            backgroundColor: task.state.taskState.colors,
                            radius: 5,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      task.description,
                      style: TextStyle(color: Colors.grey[700]),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            task.email,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                              color: colors.greyCustom,
                            ),
                          ),
                        ),
                        Text(
                          task.createdAt.formatDMY,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            color: colors.desactivated,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
