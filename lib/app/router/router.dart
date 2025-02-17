import 'package:firebase_task_app/models/models.dart';
import 'package:firebase_task_app/pages/auth/bloc/bloc_auth.dart';
import 'package:firebase_task_app/pages/home/bloc/bloc_home.dart';
import 'package:firebase_task_app/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

/// {@template GoRouterCustom}
/// TODO: Add description.
/// {@endtemplate}
class GoRouterCustom {
  /// {@macro GoRouterCustom}
  String get home => '/';

  String get login => '/login';

  String get register => '/regiter';

  String get task => '/task';

  String get taskDetails => '/task/:id';

  String get settings => '/settings';

  GoRouter get router => GoRouter(
        routes: <RouteBase>[
          GoRoute(
            path: register,
            builder: (context, state) => const RegisterPage(),
          ),
          GoRoute(
            path: login,
            builder: (context, state) => const LoginPage(),
          ),
          ShellRoute(
            builder: (context, state, child) => BlocProvider<BlocHome>(
              create: (_) => BlocHome()
                ..add(BlocHomeEventGetTasksPublic())
                ..add(BlocHomeEventGetTasksPrivate()),
              child: MainPage(child: child),
            ),
            redirect: (context, state) {
              final authState = context.read<BlocAuth>().state;

              if (authState is BlocAuthStateUnauthenticated) {
                return login;
              }
              return null;
            },
            routes: [
              GoRoute(
                path: home,
                pageBuilder: (context, state) => CustomTransitionPage(
                  key: state.pageKey,
                  child: const HomePage(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                ),
                routes: [
                  GoRoute(
                    path: taskDetails,
                    pageBuilder: (context, state) => CustomTransitionPage(
                      key: state.pageKey,
                      child: TaskDetailsPage(task: state.extra! as MTask),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                    ),
                  ),
                ],
              ),
              GoRoute(
                path: task,
                pageBuilder: (context, state) => CustomTransitionPage(
                  key: state.pageKey,
                  child: const TaskPage(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                ),
                routes: [
                  GoRoute(
                    path: taskDetails,
                    pageBuilder: (context, state) => CustomTransitionPage(
                      key: state.pageKey,
                      child: TaskDetailsPage(task: state.extra! as MTask),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                    ),
                  ),
                ],
              ),
              GoRoute(
                path: settings,
                pageBuilder: (context, state) => CustomTransitionPage(
                  key: state.pageKey,
                  child: const SettingsPage(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                ),
              ),
            ],
          ),
        ],
      );
}
