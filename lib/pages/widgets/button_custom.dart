import 'package:firebase_task_app/extension/extensions.dart';
import 'package:firebase_task_app/l10n/l10n.dart';
import 'package:flutter/material.dart';

/// {@template ButtonCustom}
/// TODO: Add description.
/// {@endtemplate}
class ButtonCustom extends StatelessWidget {
  /// {@macro ButtonCustom}
  const ButtonCustom({
    super.key,
    this.onPressed,
    this.backgroundColor,
    this.titleColor,
    this.title,
    this.child,
  });

  ///
  final void Function()? onPressed;

  ///
  final Color? backgroundColor;

  ///
  final Color? titleColor;

  ///
  final String? title;

  ///
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final l10n = context.l10n;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 12,
        ),
        backgroundColor: backgroundColor ?? colors.primary,
      ),
      child: child ??
          Center(
            child: Text(
              title ?? l10n.commonCreateTask,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: titleColor ?? colors.surface,
              ),
            ),
          ),
    );
  }
}
