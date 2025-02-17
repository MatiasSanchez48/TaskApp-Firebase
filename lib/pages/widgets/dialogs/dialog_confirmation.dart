import 'package:firebase_task_app/extension/extensions.dart';
import 'package:firebase_task_app/l10n/l10n.dart';
import 'package:firebase_task_app/pages/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// {@template DialogConfirmation}
/// TODO: Add description.
/// {@endtemplate}
class DialogConfirmation extends StatelessWidget {
  /// {@macro DialogConfirmation}
  const DialogConfirmation({
    this.onPressed,
    this.message,
    super.key,
  });

  ///
  final String? message;

  ///
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final l10n = context.l10n;

    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          Center(
            child: Text(
              message ?? l10n.commonAreYouSure,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: colors.onTertiary,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ButtonCustom(
                title: l10n.commonCancel,
                backgroundColor: colors.desactivated,
                titleColor: colors.surface,
                onPressed: () => Navigator.pop(context),
              ),
              const SizedBox(width: 10),
              ButtonCustom(
                title: l10n.commonConfirm,
                backgroundColor: colors.primary,
                titleColor: colors.surface,
                onPressed: () {
                  onPressed?.call();
                  Navigator.pop(context);
                  context.go(context.locationPrevius);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
