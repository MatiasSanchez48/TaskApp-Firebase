import 'package:firebase_task_app/extension/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// {@template ElevatedTextField}
/// TODO: Add description.
/// {@endtemplate}
class ElevatedTextField extends StatelessWidget {
  /// {@macro ElevatedTextField}
  const ElevatedTextField({
    required this.hintText,
    required this.controller,
    this.autofillHints,
    this.focusNode,
    this.inputFormatters,
    this.keyboardType,
    this.onEditingComplete,
    this.onSubmitted,
    this.maxLines = 1,
    this.decoration,
    this.borderSide = BorderSide.none,
    this.onChanged,
    super.key,
  });

  ///
  final String hintText;

  ///
  final TextEditingController controller;

  ///
  final Iterable<String>? autofillHints;

  ///
  final FocusNode? focusNode;

  ///
  final List<TextInputFormatter>? inputFormatters;

  ///
  final TextInputType? keyboardType;

  ///
  final void Function()? onEditingComplete;

  ///
  final void Function(String)? onSubmitted;

  ///
  final int? maxLines;

  ///
  final Decoration? decoration;

  ///
  final BorderSide borderSide;

  ///
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;

    return Container(
      decoration: decoration ??
          BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                spreadRadius: 1,
                blurRadius: 6,
                offset: const Offset(1, 6),
              ),
            ],
          ),
      child: TextField(
        onChanged: onChanged,
        focusNode: focusNode,
        autofillHints: autofillHints,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        onEditingComplete: onEditingComplete,
        onSubmitted: onSubmitted,
        maxLines: maxLines,
        controller: controller,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          alignLabelWithHint: true,
          filled: true,
          labelText: hintText,
          hintText: hintText,
          hintStyle: TextStyle(
            color: colors.onSurface,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: borderSide,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 20,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: borderSide,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: borderSide,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: borderSide,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: borderSide,
          ),
        ),
      ),
    );
  }
}

/// {@template ElevatedTextFieldPassword}
/// TODO: Add description.
/// {@endtemplate}

class ElevatedTextFieldPassword extends StatefulWidget {
  /// {@macro ElevatedTextFieldPassword}
  const ElevatedTextFieldPassword({
    required this.hintText,
    required this.controller,
    this.onChanged,
    this.autofillHints,
    this.focusNode,
    this.inputFormatters,
    this.keyboardType,
    this.onEditingComplete,
    this.onSubmitted,
    this.maxLines = 1,
    super.key,
  });

  ///
  final String hintText;

  ///
  final TextEditingController controller;

  ///
  final Iterable<String>? autofillHints;

  ///
  final FocusNode? focusNode;

  ///
  final List<TextInputFormatter>? inputFormatters;

  ///
  final TextInputType? keyboardType;

  ///
  final void Function()? onEditingComplete;

  ///
  final void Function(String)? onSubmitted;

  ///
  final int? maxLines;

  ///
  final void Function(String)? onChanged;

  @override
  State<ElevatedTextFieldPassword> createState() =>
      _ElevatedTextFieldPasswordState();
}

class _ElevatedTextFieldPasswordState extends State<ElevatedTextFieldPassword> {
  bool _obscureText = true;

  void _toggleVisibility() => setState(() => _obscureText = !_obscureText);

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(1, 6),
          ),
        ],
      ),
      child: TextField(
        onChanged: widget.onChanged,
        focusNode: widget.focusNode,
        autofillHints: widget.autofillHints,
        inputFormatters: widget.inputFormatters,
        keyboardType: widget.keyboardType,
        onEditingComplete: widget.onEditingComplete,
        onSubmitted: widget.onSubmitted,
        maxLines: widget.maxLines,
        controller: widget.controller,
        obscureText: _obscureText,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          filled: true,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: colors.onSurface,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 20,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide.none,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: colors.onSurface,
            ),
            onPressed: _toggleVisibility,
          ),
        ),
      ),
    );
  }
}
