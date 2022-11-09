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
      scaffoldBackgroundColor: Colors.grey.shade900,
      primaryColorLight: Color(0xfff1694a),
      colorScheme: ColorScheme.dark(),
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.shade900,
          titleTextStyle: TextStyle(color: Colors.white)),
      toggleButtonsTheme: ToggleButtonsThemeData(color: Colors.purple));

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColorLight: Color(0xfff1694a),
      colorScheme: ColorScheme.light(),
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.white)));
}
