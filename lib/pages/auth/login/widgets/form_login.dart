import 'package:firebase_task_app/l10n/l10n.dart';
import 'package:firebase_task_app/pages/widgets/widgets.dart';
import 'package:flutter/material.dart';

/// {@template FormLogin}
/// TODO: Add description.
/// {@endtemplate}
class FormLogin extends StatefulWidget {
  /// {@macro FormLogin}
  const FormLogin({
    required this.controllerPassword,
    required this.controllerEmail,
    required this.onComplete,
    super.key,
  });

  ///
  final TextEditingController controllerEmail;

  ///
  final TextEditingController controllerPassword;

  ///
  final void Function()? onComplete;

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  @override
  void dispose() {
    _focusEmail.dispose();
    _focusPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AutofillGroup(
      child: Column(
        children: [
          ElevatedTextField(
            hintText: l10n.loginPageEmail,
            focusNode: _focusEmail,
            controller: widget.controllerEmail,
            keyboardType: TextInputType.emailAddress,
            autofillHints: const [AutofillHints.email],
            onChanged: (p0) => setState(() {}),
            onSubmitted: (v) => _focusPassword.requestFocus(),
          ),
          const SizedBox(height: 20),
          ElevatedTextFieldPassword(
            hintText: l10n.loginPagePassword,
            focusNode: _focusPassword,
            controller: widget.controllerPassword,
            keyboardType: TextInputType.visiblePassword,
            autofillHints: const [AutofillHints.password],
            onChanged: (p0) => setState(() {}),
            onEditingComplete: () {
              FocusScope.of(context).unfocus();
              widget.onComplete?.call();
            },
          ),
        ],
      ),
    );
  }
}
