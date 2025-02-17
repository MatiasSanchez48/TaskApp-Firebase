import 'package:firebase_task_app/extension/extensions.dart';
import 'package:firebase_task_app/l10n/l10n.dart';
import 'package:firebase_task_app/pages/auth/bloc/bloc_auth.dart';
import 'package:firebase_task_app/pages/settings/bloc/bloc_settings.dart';
import 'package:firebase_task_app/theme/theme_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template App}
/// TODO: Add description.
/// {@endtemplate}
class App extends StatelessWidget {
  /// {@macro App}
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BlocAuth>(
          create: (context) => BlocAuth(),
        ),
        BlocProvider(
          create: (context) => BlocSettings(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

/// {@template MyApp}
/// TODO: Add description.
/// {@endtemplate}
class MyApp extends StatefulWidget {
  /// {@macro MyApp}
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final router = context.goRouterCustomRouter;

    return BlocBuilder<BlocSettings, BlocSettingsState>(
      builder: (context, state) {
        return MaterialApp.router(
          routerConfig: router,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale(state.lenguage.name),
          theme: state.theme ?? themeDefault,
        );
      },
    );
  }
}
