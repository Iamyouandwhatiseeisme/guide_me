import 'package:flutter/material.dart';

import '../enums/app_theme.dart';

// a theme provider that lets user change the apptheme
class ThemeProvider with ChangeNotifier {
  AppTheme _theme = AppTheme.light;

  AppTheme get currentTheme => _theme;

  void toggleTheme() {
    _theme = (_theme == AppTheme.light) ? AppTheme.dark : AppTheme.light;
    notifyListeners();
  }
}
