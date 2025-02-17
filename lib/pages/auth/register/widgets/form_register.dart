import 'package:firebase_task_app/l10n/l10n.dart';
import 'package:firebase_task_app/pages/widgets/widgets.dart';
import 'package:flutter/material.dart';

/// {@template FormRegister}
/// TODO: Add description.
/// {@endtemplate}
class FormRegister extends StatefulWidget {
  /// {@macro FormRegister}
  const FormRegister({
    required this.controllerEmail,
    required this.controllerPassword,
    required this.controllerRepeatPassword,
    this.onComplete,
    super.key,
  });

  ///
  final TextEditingController controllerEmail;

  ///
  final TextEditingController controllerPassword;

  ///
  final TextEditingController controllerRepeatPassword;

  ///
  final void Function()? onComplete;

  @override
  State<FormRegister> createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();
  final _focusRepeatPassword = FocusNode();

  @override
  void dispose() {
    _focusEmail.dispose();
    _focusPassword.dispose();
    _focusRepeatPassword.dispose();
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
            onChanged: (p0) => setState(() {}),
            onSubmitted: (v) => _focusRepeatPassword.requestFocus(),
          ),
          const SizedBox(height: 20),
          ElevatedTextFieldPassword(
            hintText: l10n.registerPageRepeatPassword,
            focusNode: _focusRepeatPassword,
            onChanged: (p0) => setState(() {}),
            controller: widget.controllerRepeatPassword,
            keyboardType: TextInputType.visiblePassword,
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
