import 'package:firebase_task_app/extension/extensions.dart';
import 'package:flutter/material.dart';

/// {@template DialogLoading}
/// TODO: Add description.
/// {@endtemplate}
class DialogLoading extends StatelessWidget {
  /// {@macro DialogLoading}
  const DialogLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;

    return AlertDialog(
      backgroundColor: Colors.transparent,
      content: Center(
        child: CircularProgressIndicator(
          color: colors.primary,
        ),
      ),
    );
  }
}
