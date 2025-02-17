import 'package:flutter/material.dart';

// TODO: Add description
final themeDefault = ThemeData(
  fontFamily: 'Nunito',
  colorScheme: _themeDefault,
  useMaterial3: true,
);

// TODO: Add description
const _themeDefault = ColorScheme.light(
  primary: Color(0xFFFD9A00),
  onPrimary: Color(0xFFAE8A68),
  primaryContainer: Color(0xFFFFF8EE),
  secondary: Color(0xFF00D3B4),
  onSecondary: Color(0xFF009A80),
  tertiary: Color(0xFFF2F2F2),
  onTertiary: Color(0xFF1E1E1E),
  error: Color(0xFFFF4444),
  surfaceTint: Color(0xFFFFFFFF),
  shadow: Color(0xFF1E1E1E),
);
// TODO: Add description
final themeDark = ThemeData(
  fontFamily: 'Nunito',
  colorScheme: _themeDark,
  useMaterial3: true,
);

// TODO: Add description
const _themeDark = ColorScheme.dark(
  primary: Color(0xFFFFA726),
  onPrimary: Color(0xFFF5E0C3),
  primaryContainer: Color(0xFF4E342E),
  secondary: Color(0xFF26A69A),
  onSecondary: Color(0xFF80CBC4),
  tertiary: Color(0xFF121212),
  onTertiary: Color(0xFFFFFFFF),
  error: Color(0xFFEF5350),
  surfaceTint: Color(0xFF1E1E1E),
  shadow: Color(0xFFFFFFFF),
);
