import 'package:firebase_task_app/l10n/l10n.dart';
import 'package:flutter/material.dart';

/// {@template ListEmpty}
/// TODO: Add description.
/// {@endtemplate}
class ListEmpty extends StatelessWidget {
  /// {@macro ListEmpty}
  const ListEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.sentiment_dissatisfied,
            size: 100,
            color: Colors.grey,
          ),
          const SizedBox(height: 16),
          Text(
            l10n.commonThereAreNoTasks,
            style: const TextStyle(
              fontSize: 30,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
