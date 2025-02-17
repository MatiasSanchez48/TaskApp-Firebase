import 'package:firebase_task_app/extension/extensions.dart';
import 'package:firebase_task_app/l10n/l10n.dart';
import 'package:firebase_task_app/pages/auth/bloc/bloc_auth.dart';
import 'package:firebase_task_app/services/auth_firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template LogWithSocialAccount}
/// TODO: Add description.
/// {@endtemplate}
class LogWithSocialAccount extends StatefulWidget {
  /// {@macro LogWithSocialAccount}
  const LogWithSocialAccount({super.key});

  @override
  State<LogWithSocialAccount> createState() => _LogWithSocialAccountState();
}

class _LogWithSocialAccountState extends State<LogWithSocialAccount> {
  final authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colorScheme;

    return Column(
      children: [
        Text(
          l10n.loginPageLogInWithSocialAccount,
          style: TextStyle(
            fontSize: 16,
            color: colors.onTertiary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () => context.read<BlocAuth>().add(
                    BlocAuthLoginWithGoogleEvent(),
                  ),
              icon: const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(
                  'assets/images/google.png',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
