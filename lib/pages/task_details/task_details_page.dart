import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_task_app/extension/extensions.dart';
import 'package:firebase_task_app/l10n/l10n.dart';
import 'package:firebase_task_app/models/models.dart';
import 'package:firebase_task_app/pages/task_details/widgets/widgets.dart';
import 'package:firebase_task_app/pages/widgets/widgets.dart';
import 'package:flutter/material.dart';

/// {@template TaskDetailsPage}
/// TODO: Add description.
/// {@endtemplate}
class TaskDetailsPage extends StatefulWidget {
  /// {@macro TaskDetailsPage}
  const TaskDetailsPage({
    required this.task,
    super.key,
  });

  ///
  final MTask task;

  @override
  State<TaskDetailsPage> createState() => _TaskDetailsPageState();
}

class _TaskDetailsPageState extends State<TaskDetailsPage> {
  ///
  final _formKey = GlobalKey<FormState>();

  ///
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  ///
  late Color _colorTask;

  ///
  late int _currentState;

  ///
  final currentUser = FirebaseAuth.instance.currentUser;

  ///
  bool get isOwner => widget.task.authorUid == currentUser?.uid;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task.title);
    _descriptionController =
        TextEditingController(text: widget.task.description);
    _currentState = widget.task.state;
    _colorTask = widget.task.color.toColorTask;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.taskDetailsPageDetails)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                ChangeImageTask(task: widget.task),
                const SizedBox(height: 10),
                ChangeTitleAndDescription(
                  titleController: _titleController,
                  descriptionController: _descriptionController,
                ),
                ChangeStateTask(
                  currentState: _currentState,
                  onPressed: () => setState(
                    () => _currentState = _currentState.changeState,
                  ),
                ),
                const SizedBox(height: 10),
                ChangeColorTask(
                  colorTask: _colorTask,
                  onColorPicker: (c) => setState(
                    () => _colorTask = c ?? _colorTask,
                  ),
                ),
                const Spacer(),
                ButtonsAndCreatedAt(
                  color: _colorTask,
                  isOwner: isOwner,
                  task: widget.task,
                  title: _titleController.text,
                  description: _descriptionController.text,
                  state: _currentState,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
