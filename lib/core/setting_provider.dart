import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier {
  String currentLanguage = "en";
  ThemeMode currentThemeMode = ThemeMode.light;

  changeCurrentLanguage(String newLanguage) {
    if (currentLanguage == newLanguage) return;
    currentLanguage = newLanguage;
    notifyListeners();
  }

  changeCurrentThemeMode(ThemeMode newThemeMode) {
    if (currentThemeMode == newThemeMode) return;
    currentThemeMode = newThemeMode;
    notifyListeners();
  }

  String getBackGroundImage() {
    return (currentThemeMode == ThemeMode.light)
        ? "assets/images/default_bg.png"
        : "assets/images/dark_bg.png";
  }

  bool isDark() {
    return currentThemeMode == ThemeMode.dark;
  }
}
