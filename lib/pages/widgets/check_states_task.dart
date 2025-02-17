import 'package:firebase_task_app/extension/extensions.dart';
import 'package:firebase_task_app/pages/widgets/enums/enums.dart';
import 'package:flutter/material.dart';
/// {@template CheckStatesTask}
/// TODO: Add description.
/// {@endtemplate}
class CheckStatesTask extends StatelessWidget {
  /// {@macro CheckStatesTask}
  const CheckStatesTask({
    required this.value,
    this.onChanged,
    super.key,
  });

  ///
  final TaskStates value;

  ///
  final void Function(TaskStates?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ...TaskStates.values.map(
          (e) => CheckCustom(
            onChanged: onChanged,
            taskStates: e,
            value: value,
            title: e.name.toUpperCase(),
          ),
        ),
      ],
    );
  }
}

class CheckCustom extends StatelessWidget {
  const CheckCustom({
    required this.value,
    required this.title,
    required this.taskStates,
    this.onChanged,
    super.key,
  });

  ///
  final TaskStates taskStates;

  ///
  final String title;

  ///
  final TaskStates value;

  ///
  final void Function(TaskStates?)? onChanged;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;

    return Row(
      children: [
        Checkbox(
          value: taskStates == value,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.comfortable,
          checkColor: Colors.transparent,
          onChanged: (v) => onChanged?.call(taskStates),
          shape: CircleBorder(
            eccentricity: 0.5,
            side: BorderSide(
              color: colors.greyCustom,
              width: 2,
            ),
          ),
          side: BorderSide(
            color: colors.greyCustom,
            width: 2,
          ),
        ),
        GestureDetector(
          onTap: () => onChanged?.call(taskStates),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: colors.greyCustom,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
