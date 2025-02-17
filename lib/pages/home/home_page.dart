import 'package:firebase_task_app/extension/extensions.dart';
import 'package:firebase_task_app/l10n/l10n.dart';
import 'package:firebase_task_app/pages/home/bloc/bloc_home.dart';
import 'package:firebase_task_app/pages/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template HomePage}
/// TODO: Add description.
/// {@endtemplate}
class HomePage extends StatelessWidget {
  /// {@macro HomePage}
  const HomePage({super.key});

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
                  child: Text(
                    l10n.homePageTitle,
                    textScaler: const TextScaler.linear(2.5),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: colors.primaryTitle,
                    ),
                  ),
                ),
                if (state.tasksPublic?.isEmpty ?? true) ...[
                  const SizedBox(height: 30),
                  const ListEmpty(),
                ],
                ...state.tasksPublic?.map((task) => TaskCard(task: task)) ?? [],
              ],
            ),
          ),
        );
      },
    );
  }
}
