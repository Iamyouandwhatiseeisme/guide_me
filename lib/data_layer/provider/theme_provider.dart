import 'package:flutter/material.dart';

import '../enums/app_theme.dart';

class ThemeProvider with ChangeNotifier {
  AppTheme _theme = AppTheme.light;

  AppTheme get currentTheme => _theme;

  void toggleTheme() {
    _theme = (_theme == AppTheme.light) ? AppTheme.dark : AppTheme.light;
    notifyListeners();
  }
}
