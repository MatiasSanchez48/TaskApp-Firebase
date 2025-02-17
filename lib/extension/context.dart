import 'package:firebase_task_app/app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// {@template ContextX}
/// TODO: Add description.
/// {@endtemplate}
extension ContextX on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => theme.colorScheme;

  GoRouter get goRouterCustomRouter => GoRouterCustom().router;

  GoRouterCustom get goRouterCustom => GoRouterCustom();

  String get locationTop => GoRouterState.of(this).topRoute?.path ?? '/';

  String get locationPrevius {
    final router = GoRouter.of(this);
    final matches = router.routerDelegate.currentConfiguration.matches;

    if (matches.length > 1) {
      return matches[matches.length - 2].matchedLocation;
    }
    return '/';
  }
}
