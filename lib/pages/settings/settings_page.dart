import 'package:firebase_task_app/app/router/router.dart';
import 'package:firebase_task_app/extension/context.dart';
import 'package:firebase_task_app/l10n/l10n.dart';
import 'package:firebase_task_app/pages/auth/bloc/bloc_auth.dart';
import 'package:firebase_task_app/pages/settings/bloc/bloc_settings.dart';
import 'package:firebase_task_app/pages/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

/// {@template SettingsPage}
/// TODO: Add description.
/// {@endtemplate}
class SettingsPage extends StatefulWidget {
  /// {@macro SettingsPage}
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  ///
  late Lenguage _selectedLanguage = Lenguage.en;

  ///
  Future<void> _onDialogConfirmLogOut() async {
    final goRouter = GoRouterCustom();

    await showDialog<void>(
      context: context,
      builder: (_) => DialogConfirmation(
        onPressed: () async {
          context.read<BlocAuth>().add(BlocAuthLogoutEvent());
          // ignore: inference_failure_on_instance_creation
          await Future.delayed(const Duration(milliseconds: 500));
          context.replace(goRouter.login);
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    final state = context.read<BlocSettings>().state;
    _selectedLanguage = state.lenguage;
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingsPageTitle)),
      body: BlocBuilder<BlocSettings, BlocSettingsState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  SwitchListTile(
                    title: Text(l10n.settingsPageDartTheme),
                    value: state.isDarkMode,
                    onChanged: (value) => context.read<BlocSettings>().add(
                          BlocSettingsEventChangeTheme(isDarkMode: value),
                        ),
                  ),
                  ListTile(
                    title: Text(l10n.settingsPageChangeLenguage),
                    subtitle: Text(_selectedLanguage.name),
                    trailing: DropdownButton<Lenguage>(
                      value: state.lenguage,
                      onChanged: (Lenguage? newValue) {
                        if (newValue != null) {
                          context.read<BlocSettings>().add(
                                BlocSettingsEventChangeLenguage(
                                  lenguage: newValue,
                                ),
                              );
                        }
                      },
                      items: Lenguage.values.map((Lenguage language) {
                        return DropdownMenuItem<Lenguage>(
                          value: language,
                          child: Text(language.name),
                        );
                      }).toList(),
                    ),
                  ),
                  const Spacer(),
                  ButtonCustom(
                    backgroundColor: colors.error.withValues(alpha: .7),
                    onPressed: _onDialogConfirmLogOut,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            l10n.settingsPageLogOut,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: colors.surface,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Icon(
                            Icons.logout,
                            size: 30,
                            color: colors.surface,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
