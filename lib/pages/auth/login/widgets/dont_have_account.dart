import 'package:firebase_task_app/app/router/router.dart';
import 'package:firebase_task_app/extension/extensions.dart';
import 'package:firebase_task_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// {@template DontHaveAccount}
/// TODO: Add description.
/// {@endtemplate}
class DontHaveAccount extends StatelessWidget {
  /// {@macro DontHaveAccount}
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final l10n = context.l10n;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Text(
            l10n.loginPageDontHaveAccount,
            style: TextStyle(
              fontSize: 16,
              color: colors.onTertiary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () => context.go(GoRouterCustom().register),
            child: Text(
              l10n.loginPageSignUp,
              style: TextStyle(
                fontSize: 16,
                color: colors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
