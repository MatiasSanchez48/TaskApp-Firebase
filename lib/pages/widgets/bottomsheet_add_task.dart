import 'package:firebase_task_app/extension/extensions.dart';
import 'package:firebase_task_app/l10n/l10n.dart';
import 'package:firebase_task_app/pages/home/bloc/bloc_home.dart';
import 'package:firebase_task_app/pages/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template BottomsheetAddTask}
/// TODO: Add description.
/// {@endtemplate}
class BottomsheetAddTask extends StatefulWidget {
  /// {@macro BottomsheetAddTask}
  const BottomsheetAddTask({super.key});

  @override
  State<BottomsheetAddTask> createState() => _BottomsheetAddTaskState();
}

class _BottomsheetAddTaskState extends State<BottomsheetAddTask> {
  ///
  final _formKey = GlobalKey<FormState>();

  ///
  final _titleController = TextEditingController();
  final _titleFocus = FocusNode();

  final _descriptionController = TextEditingController();
  final _descriptionFocus = FocusNode();

  ///
  Color _colorTask = Colors.white;

  ///
  TaskStates _taskState = TaskStates.public;

  ///
  bool get isEmpty =>
      _titleController.text.isEmpty || _descriptionController.text.isEmpty;

  void _onCreateTask() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).pop();
      context.read<BlocHome>().add(
            BlocHomeEventAddNewTask(
              title: _titleController.text,
              description: _descriptionController.text,
              state: _taskState,
              color: _colorTask.colorHex,
            ),
          );
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _titleFocus.dispose();
    _descriptionFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final l10n = context.l10n;

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 30),
              Text(
                l10n.commonAddNewTask,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: colors.primaryTitle,
                ),
              ),
              Divider(
                thickness: 2,
                color: colors.greyCustom,
              ),
              const SizedBox(height: 25),
              ElevatedTextField(
                decoration: const BoxDecoration(),
                borderSide: BorderSide(
                  color: colors.greyCustom,
                  width: 2,
                ),
                hintText: l10n.taskDetailsPageTitle,
                controller: _titleController,
                keyboardType: TextInputType.text,
                focusNode: _titleFocus,
                onSubmitted: (v) => _descriptionFocus.requestFocus(),
                onChanged: (p0) => setState(() {
                  isEmpty;
                }),
              ),
              const SizedBox(height: 20),
              ElevatedTextField(
                decoration: const BoxDecoration(),
                borderSide: BorderSide(
                  color: colors.greyCustom,
                  width: 2,
                ),
                hintText: l10n.taskDetailsPageDescription,
                controller: _descriptionController,
                focusNode: _descriptionFocus,
                keyboardType: TextInputType.multiline,
                onEditingComplete: _onCreateTask,
                onSubmitted: (v) => _onCreateTask,
                onChanged: (p0) => setState(() {
                  isEmpty;
                }),
                maxLines: 5,
              ),
              const SizedBox(height: 20),
              CheckStatesTask(
                value: _taskState,
                onChanged: (v) =>
                    setState(() => _taskState = v ?? TaskStates.public),
              ),
              const SizedBox(height: 10),
              ChangeColorTask(
                colorTask: _colorTask,
                onColorPicker: (c) => setState(
                  () => _colorTask = c ?? _colorTask,
                ),
              ),
              const SizedBox(height: 10),
              const Spacer(),
              ButtonCustom(onPressed: isEmpty ? null : _onCreateTask),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
