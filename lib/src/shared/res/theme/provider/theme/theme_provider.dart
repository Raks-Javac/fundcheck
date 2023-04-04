import 'package:flutter/material.dart';

import '../../../res.dart';

enum AppThemeMode {
  light,
  dark,
}

class ThemeProvider extends ChangeNotifier {
  AppThemeMode state = AppThemeMode.light;
  AppThemeMode get mode => state;

  changeThemeState(AppThemeMode changeMode) {
    state = changeMode;
    notifyListeners();
  }

  changeIfBool(bool boolMode) {
    if (boolMode == true) {
      state = AppThemeMode.light;
    } else {
      state = AppThemeMode.dark;
    }
    notifyListeners();
  }

  ThemeData? returnThemeBasedOnMode() {
    if (state == AppThemeMode.light) {
      return FTheme.lightTheme;
    }
    if (state == AppThemeMode.dark) {
      return FTheme.darkTheme;
    }
    notifyListeners();
    return FTheme.lightTheme;
  }
}
