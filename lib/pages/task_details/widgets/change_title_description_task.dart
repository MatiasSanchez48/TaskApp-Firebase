import 'package:firebase_task_app/extension/extensions.dart';
import 'package:firebase_task_app/l10n/l10n.dart';
import 'package:firebase_task_app/pages/widgets/widgets.dart';
import 'package:flutter/material.dart';

/// {@template ChangeTitleAndDescription}
/// TODO: Add description.
/// {@endtemplate}
class ChangeTitleAndDescription extends StatefulWidget {
  /// {@macro ChangeTitleAndDescription}
  const ChangeTitleAndDescription({
    required this.descriptionController,
    required this.titleController,
    super.key,
  });

  ///
  final TextEditingController titleController;

  ///
  final TextEditingController descriptionController;

  @override
  State<ChangeTitleAndDescription> createState() =>
      _ChangeTitleAndDescriptionState();
}

class _ChangeTitleAndDescriptionState extends State<ChangeTitleAndDescription> {
  ///
  final _titleFocus = FocusNode();
  final _descriptionFocus = FocusNode();

  @override
  void dispose() {
    _titleFocus.dispose();
    _descriptionFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final l10n = context.l10n;

    return Column(
      children: [
        ElevatedTextField(
          decoration: const BoxDecoration(),
          borderSide: BorderSide(
            color: colors.greyCustom,
            width: 2,
          ),
          hintText: l10n.taskDetailsPageTitle,
          controller: widget.titleController,
          keyboardType: TextInputType.text,
          focusNode: _titleFocus,
          onSubmitted: (v) => _descriptionFocus.requestFocus(),
        ),
        const SizedBox(height: 10),
        ElevatedTextField(
          decoration: const BoxDecoration(),
          borderSide: BorderSide(
            color: colors.greyCustom,
            width: 2,
          ),
          hintText: l10n.taskDetailsPageDescription,
          controller: widget.descriptionController,
          focusNode: _descriptionFocus,
          keyboardType: TextInputType.multiline,
          maxLines: 5,
        ),
      ],
    );
  }
}
