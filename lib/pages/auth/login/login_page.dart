import 'package:firebase_task_app/extension/extensions.dart';
import 'package:firebase_task_app/l10n/l10n.dart';
import 'package:firebase_task_app/pages/auth/bloc/bloc_auth.dart';
import 'package:firebase_task_app/pages/auth/login/widgets/widgets.dart';
import 'package:firebase_task_app/pages/widgets/dialogs/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template LoginPage}
/// TODO: Add description.
/// {@endtemplate}
class LoginPage extends StatefulWidget {
  /// {@macro LoginPage}
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ///
  final _keyForm = GlobalKey<FormState>();

  ///
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  ///
  bool get isEmpty =>
      _emailController.text.isEmpty || _passwordController.text.isEmpty;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  ///
  void _login() {
    if (_keyForm.currentState!.validate()) {
      if (_emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty) {
        context.read<BlocAuth>().add(
              BlocAuthLoginWithCredentialsEvent(
                email: _emailController.text,
                password: _passwordController.text,
              ),
            );
      }
    }
  }

  ///
  void _dialogLoading() => showDialog<void>(
        context: context,
        builder: (context) => const DialogLoading(),
      );

  ///
  void _dialogError() => showDialog<void>(
        context: context,
        builder: (context) => const DialogError(),
      );

  ///
  void _dialogSuccess() => showDialog<void>(
        context: context,
        builder: (context) => const DialogSuccess(),
      );

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final l10n = context.l10n;

    return Scaffold(
      body: BlocConsumer<BlocAuth, BlocAuthState>(
        listener: (context, state) {
          if (state is BlocAuthStateLoged) {
            Navigator.pop(context);
            _dialogSuccess();
          }
          if (state is BlocAuthStateLoading) {
            _dialogLoading();
          }
          if (state is BlocAuthStateFailedToLogin) {
            Navigator.pop(context);
            _dialogError();
          }
        },
        builder: (context, state) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: _keyForm,
                    child: Column(
                      children: [
                        const SizedBox(height: 100),
                        Center(
                          child: Text(
                            l10n.loginPageLogIn,
                            textScaler: const TextScaler.linear(1.2),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: colors.primaryTitle,
                            ),
                          ),
                        ),
                        const SizedBox(height: 100),
                        FormLogin(
                          controllerEmail: _emailController,
                          controllerPassword: _passwordController,
                          onComplete: _login,
                        ),
                        const SizedBox(height: 20),
                        const RemerberAndForgotPassword(),
                        const SizedBox(height: 80),
                        const LogWithSocialAccount(),
                        const Spacer(),
                        const DontHaveAccount(),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: isEmpty ? null : _login,
                          style: ElevatedButton.styleFrom(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                            backgroundColor: colors.primary,
                          ),
                          child: Center(
                            child: Text(
                              l10n.loginPageLogIn,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: colors.surface,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 60),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
