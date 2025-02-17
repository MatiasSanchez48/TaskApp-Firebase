import 'package:firebase_task_app/extension/extensions.dart';
import 'package:firebase_task_app/l10n/l10n.dart';
import 'package:flutter/material.dart';

/// {@template DialogError}
/// TODO: Add description.
/// {@endtemplate}
class DialogError extends StatelessWidget {
  /// {@macro DialogError}
  const DialogError({
    this.message,
    super.key,
  });

  ///
  final String? message;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final l10n = context.l10n;

    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.error_outline_outlined,
            color: colors.error,
            size: 100,
          ),
          Center(
            child: Text(
              l10n.commonError,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: colors.error,
              ),
            ),
          ),
          Center(
            child: Text(
              message ?? l10n.commonSomethingWentWrong,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: colors.onTertiary,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
            ),
            child: Center(
              child: Text(
                l10n.taskDetailsPageButtonBack,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: colors.onTertiary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
