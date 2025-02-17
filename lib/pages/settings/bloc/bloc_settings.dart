import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_task_app/pages/widgets/widgets.dart';
import 'package:firebase_task_app/theme/theme_default.dart';
import 'package:flutter/material.dart';

part 'bloc_settings_event.dart';
part 'bloc_settings_state.dart';

/// {@template BlocSettings}
/// TODO: Add description.
/// {@endtemplate}
class BlocSettings extends Bloc<BlocSettingsEvent, BlocSettingsState> {
  /// {@macro BlocSettings}
  BlocSettings() : super(const BlocSettingsStateInitial()) {
    on<BlocSettingsEventChangeLenguage>(_onChangeLenguage);
    on<BlocSettingsEventChangeTheme>(_onChangeTheme);
  }

  void _onChangeTheme(
    BlocSettingsEventChangeTheme event,
    Emitter<BlocSettingsState> emit,
  ) {
    emit(BlocSettingsStateLoading.from(state));
    if (event.isDarkMode) {
      emit(
        BlocSettingsStateSuccess.from(
          state,
          theme: themeDark,
          isDarkMode: event.isDarkMode,
        ),
      );
    } else {
      emit(
        BlocSettingsStateSuccess.from(
          state,
          theme: themeDefault,
          isDarkMode: event.isDarkMode,
        ),
      );
    }
  }

  void _onChangeLenguage(
    BlocSettingsEventChangeLenguage event,
    Emitter<BlocSettingsState> emit,
  ) =>
      emit(BlocSettingsStateSuccess.from(state, lenguage: event.lenguage));
}
