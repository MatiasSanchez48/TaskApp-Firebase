import 'package:firebase_task_app/app/router/router.dart';
import 'package:firebase_task_app/extension/extensions.dart';
import 'package:firebase_task_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// {@template DialogSuccess}
/// TODO: Add description.
/// {@endtemplate}
class DialogSuccess extends StatelessWidget {
  /// {@macro DialogSuccess}
  const DialogSuccess({
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
          const Icon(
            Icons.check,
            color: Colors.green,
            size: 100,
          ),
          Center(
            child: Text(
              l10n.commonSuccess,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.green,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            message ?? '',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: colors.onTertiary,
            ),
          ),
          ElevatedButton(
            onPressed: () => context.go(GoRouterCustom().home),
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
                l10n.commonOk,
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
