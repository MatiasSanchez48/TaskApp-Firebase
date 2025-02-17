import 'package:firebase_task_app/extension/extensions.dart';
import 'package:firebase_task_app/l10n/l10n.dart';
import 'package:firebase_task_app/pages/auth/bloc/bloc_auth.dart';
import 'package:firebase_task_app/pages/auth/login/widgets/widgets.dart';
import 'package:firebase_task_app/pages/auth/register/widgets/widgets.dart';
import 'package:firebase_task_app/pages/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template RegisterPage}
/// TODO: Add description.
/// {@endtemplate}
class RegisterPage extends StatefulWidget {
  /// {@macro RegisterPage}
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  ///
  final _keyForm = GlobalKey<FormState>();

  ///
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();

  ///
  bool get isEmpty =>
      _emailController.text.isEmpty ||
      _passwordController.text.isEmpty ||
      _repeatPasswordController.text.isEmpty;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }

  ///
  void _register() {
    if (_keyForm.currentState!.validate()) {
      if (_passwordController.text == _repeatPasswordController.text) {
        if (_emailController.text.isNotEmpty &&
            _passwordController.text.isNotEmpty &&
            _repeatPasswordController.text.isNotEmpty) {
          context.read<BlocAuth>().add(
                BlocAuthRegisterWithCredentialsEvent(
                  email: _emailController.text,
                  password: _passwordController.text,
                ),
              );
        }
      }
    }
  }

  ///
  void _dialogLoading() => showDialog<void>(
        context: context,
        builder: (context) => const DialogLoading(),
      );

  ///
  void _dialogError({String? message}) => showDialog<void>(
        context: context,
        builder: (context) => DialogError(message: message),
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
          if (state is BlocAuthStateFailedToRegisterAlreadyUse) {
            Navigator.pop(context);
            _dialogError(message: l10n.registerPageEmailInUse);
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
                            l10n.registerPageSignUp,
                            textScaler: const TextScaler.linear(1.2),
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: colors.primaryTitle,
                            ),
                          ),
                        ),
                        const SizedBox(height: 100),
                        FormRegister(
                          controllerEmail: _emailController,
                          controllerPassword: _passwordController,
                          controllerRepeatPassword: _repeatPasswordController,
                          onComplete: _register,
                        ),
                        const SizedBox(height: 80),
                        const LogWithSocialAccount(),
                        const Spacer(),
                        const IHaveAccount(),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: isEmpty ? null : _register,
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
                              l10n.registerPageSignUp,
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
