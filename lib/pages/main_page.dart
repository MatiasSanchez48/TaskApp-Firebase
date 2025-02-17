import 'package:firebase_task_app/extension/extensions.dart';
import 'package:firebase_task_app/l10n/l10n.dart';
import 'package:firebase_task_app/pages/home/bloc/bloc_home.dart';
import 'package:firebase_task_app/pages/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

/// {@template MainPage}
/// TODO: Add description.
/// {@endtemplate}
class MainPage extends StatelessWidget {
  /// {@macro MainPage}
  const MainPage({
    required this.child,
    super.key,
  });

  final Widget child;

  // 🔹 Obtiene el índice seleccionado según la ruta actual
  int _getSelectedIndex(String location) => switch (location) {
        '/' => 0,
        '/task' => 1,
        '/settings' => 2,
        _ => 0,
      };

  void _onRedirect(BuildContext context, int index) => switch (index) {
        0 => context.go('/'),
        1 => context.go('/task'),
        2 => context.go('/settings'),
        _ => context.go('/'),
      };

  void _bottomSheetAddTask(BuildContext context) => showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        builder: (_) => BlocProvider.value(
          value: context.read<BlocHome>(),
          child: const BottomsheetAddTask(),
        ),
      );

  ///
  void _dialogLoading(BuildContext context) => showDialog<void>(
        context: context,
        builder: (context) => const DialogLoading(),
      );

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final l10n = context.l10n;
    final location = context.locationTop;

    return SafeArea(
      child: BlocListener<BlocHome, BlocHomeState>(
        listener: (context, state) {
          if (state is BlocHomeStateSuccessToCreateTask) {
            Navigator.pop(context);
            SnackbarSuccess(
              message: l10n.commonSuccessToCreateTask,
            ).show(context);
          }
          if (state is BlocHomeStateSuccessToModifyTask) {
            Navigator.pop(context);
            SnackbarSuccess(
              message: l10n.commonSuccessToUpdateTask,
            ).show(context);
          }
          if (state is BlocHomeStateSuccessToDeleteTask) {
            Navigator.pop(context);
            SnackbarSuccess(
              message: l10n.commonSuccessToDeleteTask,
            ).show(context);
          }
          if (state is BlocHomeStateError) {
            Navigator.pop(context);
            SnackbarSuccess(
              message: l10n.commonError,
            ).show(context);
          }
          if (state is BlocHomeStateLoading) {
            _dialogLoading(context);
          }
        },
        child: Scaffold(
          body: child,
          floatingActionButton: location == '/' || location == '/task'
              ? FloatingActionButton(
                  tooltip: l10n.commonAddNewTask,
                  backgroundColor: colors.primary,
                  onPressed: () => _bottomSheetAddTask(context),
                  child: Icon(
                    Icons.add,
                    color: colors.surface,
                  ),
                )
              : null,
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: colors.surface,
            type: BottomNavigationBarType.shifting,
            elevation: 10,
            currentIndex: _getSelectedIndex(location),
            onTap: (index) => _onRedirect(context, index),
            selectedLabelStyle: TextStyle(
              color: colors.primary,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            selectedItemColor: colors.primary,
            unselectedItemColor: colors.primary,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: l10n.commonHome,
                tooltip: l10n.commonHome,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.lock_outline),
                label: l10n.commonTasks,
                tooltip: l10n.commonTasks,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: l10n.commonSettings,
                tooltip: l10n.commonSettings,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
