import 'package:firebase_task_app/extension/extensions.dart';
import 'package:firebase_task_app/l10n/l10n.dart';
import 'package:flutter/material.dart';

/// {@template SnackbarSuccess}
/// TODO: Add description.
/// {@endtemplate}
class SnackbarSuccess extends StatelessWidget {
  /// {@macro SnackbarSuccess}
  const SnackbarSuccess({
    this.message,
    super.key,
  });

  ///
  final String? message;

  Future<void> show(BuildContext context) async {
    final colors = context.colorScheme;
    final l10n = context.l10n;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: SnackbarSuccess(
          message: message,
        ),
        backgroundColor: colors.surface,
        action: SnackBarAction(
          backgroundColor: colors.primary,
          textColor: colors.surface,
          label: l10n.commonConfirm,
          onPressed: () =>
              ScaffoldMessenger.of(context).removeCurrentSnackBar(),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;

    return Text(
      message ?? '',
      style: TextStyle(
        fontWeight: FontWeight.w500,
        color: colors.onSurface,
        fontSize: 16,
      ),
    );
  }
}
