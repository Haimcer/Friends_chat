import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class Mythemes {
  static final darkTheme = ThemeData(
      buttonColor: Color(0xfff4285F4),
      scaffoldBackgroundColor: Colors.grey.shade900,
      primaryColorLight: const Color(0xfff1694a),
      colorScheme: const ColorScheme.dark(),
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.shade900,
          titleTextStyle: const TextStyle(color: Colors.white)),
      toggleButtonsTheme: const ToggleButtonsThemeData(color: Colors.purple));

  static final lightTheme = ThemeData(
      buttonColor: Color(0xfffffffff),
      scaffoldBackgroundColor: Colors.white,
      primaryColorLight: const Color(0xfff1694a),
      colorScheme: const ColorScheme.light(),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.white)));
}
