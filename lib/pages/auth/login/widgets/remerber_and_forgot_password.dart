import 'package:firebase_task_app/extension/extensions.dart';
import 'package:firebase_task_app/l10n/l10n.dart';
import 'package:flutter/material.dart';

/// {@template RemerberAndForgotPassword}
/// TODO: Add description.
/// {@endtemplate}
class RemerberAndForgotPassword extends StatefulWidget {
  /// {@macro RemerberAndForgotPassword}
  const RemerberAndForgotPassword({super.key});

  @override
  State<RemerberAndForgotPassword> createState() =>
      _RemerberAndForgotPasswordState();
}

class _RemerberAndForgotPasswordState extends State<RemerberAndForgotPassword> {
  ///
  bool _remember = false;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colorScheme;

    return Row(
      children: [
        Row(
          children: [
            Checkbox(
              value: _remember,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.comfortable,
              checkColor: Colors.transparent,
              onChanged: (v) => setState(() => _remember = v ?? false),
              shape: const CircleBorder(
                eccentricity: 0.5,
                side: BorderSide(
                  color: Colors.black54,
                  width: 2,
                ),
              ),
              side: const BorderSide(
                color: Colors.black54,
                width: 2,
              ),
            ),
            GestureDetector(
              onTap: () => setState(() => _remember = !_remember),
              child: Text(
                l10n.loginPageRememberMe,
                style: TextStyle(
                  fontSize: 16,
                  color: colors.onTertiary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const Spacer(),
        Row(
          children: [
            InkWell(
              onTap: () {
                // TODO: Navigate to forgot password
              },
              child: Text(
                l10n.loginPageForgotPassword,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 16,
                  color: colors.onTertiary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
