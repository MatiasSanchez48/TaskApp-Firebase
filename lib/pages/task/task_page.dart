import 'package:firebase_task_app/extension/extensions.dart';
import 'package:firebase_task_app/l10n/l10n.dart';
import 'package:firebase_task_app/pages/home/bloc/bloc_home.dart';
import 'package:firebase_task_app/pages/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template TaskPage}
/// TODO: Add description.
/// {@endtemplate}
class TaskPage extends StatelessWidget {
  /// {@macro TaskPage}
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final l10n = context.l10n;

    return BlocBuilder<BlocHome, BlocHomeState>(
      builder: (context, state) {
        if (state is BlocHomeStateLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: colors.primary,
            ),
          );
        }
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        l10n.taskPageTitle,
                        textScaler: const TextScaler.linear(1.5),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: colors.primaryTitle,
                        ),
                      ),
                      Tooltip(
                        message: l10n.taskPageMessageTooltip,
                        decoration: BoxDecoration(
                          color: colors.surface,
                          border: Border.all(
                            color: colors.greyCustom,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        textStyle: TextStyle(
                          color: colors.onTertiary,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                        child: Icon(
                          Icons.error_outline,
                          color: colors.onTertiary,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                if (state.tasksPrivate?.isEmpty ?? true) ...[
                  const SizedBox(height: 30),
                  const ListEmpty(),
                ],
                ...state.tasksPrivate?.map((task) => TaskCard(task: task)) ??
                    [],
              ],
            ),
          ),
        );
      },
    );
  }
}
