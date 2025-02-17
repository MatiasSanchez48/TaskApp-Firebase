import 'package:firebase_task_app/extension/extensions.dart';
import 'package:firebase_task_app/l10n/l10n.dart';
import 'package:firebase_task_app/pages/task_details/widgets/dialogs/dialogs.dart';
import 'package:flutter/material.dart';

/// {@template ChangeColorTask}
/// TODO: Add description.
/// {@endtemplate}

class ChangeColorTask extends StatefulWidget {
  /// {@macro ChangeColorTask}
  const ChangeColorTask({
    required this.colorTask,
    this.onColorPicker,
    super.key,
  });

  ///
  final Color colorTask;

  ///
  final void Function(Color?)? onColorPicker;

  @override
  State<ChangeColorTask> createState() => _ChangeColorTaskState();
}

class _ChangeColorTaskState extends State<ChangeColorTask> {
  ///
  late Color _color = widget.colorTask;

  ///
  Future<void> _showDialogPickerColor(BuildContext context) async {
    final color = await const DialogPickerColor().show(context);
    setState(() => _color = color ?? widget.colorTask);
    return widget.onColorPicker?.call(color);
  }

  @override
  void initState() {
    super.initState();
    _color = widget.colorTask;
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final l10n = context.l10n;

    return Row(
      children: [
        Text(
          l10n.commonColor,
          style: const TextStyle(fontSize: 16),
        ),
        Expanded(
          child: InkWell(
            onTap: () => _showDialogPickerColor(context),
            child: Container(
              height: 24,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: colors.onTertiary),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
