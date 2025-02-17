import 'package:firebase_task_app/extension/context.dart';
import 'package:firebase_task_app/l10n/l10n.dart';
import 'package:firebase_task_app/pages/widgets/button_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class DialogPickerColor extends StatefulWidget {
  const DialogPickerColor({super.key});

  @override
  State<DialogPickerColor> createState() => _DialogPickerColorState();

  Future<Color?> show(BuildContext context) => showDialog<Color>(
        context: context,
        builder: (_) => const DialogPickerColor(),
      );
}

class _DialogPickerColorState extends State<DialogPickerColor> {
  /// create some values
  Color pickerColor = const Color(0xff443a49);
  Color currentColor = const Color(0xff443a49);

  void _changeColor(Color color) => setState(() => pickerColor = color);

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final l10n = context.l10n;

    return AlertDialog(
      title: Text(l10n.taskDetailsPageDialogPickAColor),
      content: SingleChildScrollView(
        child: MaterialPicker(
          pickerColor: pickerColor,
          onColorChanged: _changeColor,
        ),
      ),
      actions: <Widget>[
        ButtonCustom(
          title: l10n.taskDetailsPagePick,
          backgroundColor: colors.onSurface,
          onPressed: () {
            setState(() => currentColor = pickerColor);
            Navigator.of(context).pop(currentColor);
          },
        ),
      ],
    );
  }
}
