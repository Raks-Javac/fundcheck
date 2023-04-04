import 'package:flutter/material.dart';
import 'package:fundcheck/src/core/utils/constants.dart';

import '../../../res.dart';

enum AppThemeEnum {
  light,
  dark,
}

class ThemeProvider extends ChangeNotifier {
  AppThemeEnum state = AppThemeEnum.light;
  AppThemeEnum get mode => state;

  changeThemeState(AppThemeEnum changeMode) {
    state = changeMode;
    FConstants.appThemeMode = state;
    notifyListeners();
  }

  changeIfBool(bool boolMode) {
    if (boolMode == true) {
      state = AppThemeEnum.light;
    } else {
      state = AppThemeEnum.dark;
    }
    notifyListeners();
  }

  ThemeData? returnThemeBasedOnMode() {
    if (state == AppThemeEnum.light) {
      return FTheme.lightTheme;
    }
    if (state == AppThemeEnum.dark) {
      return FTheme.darkTheme;
    }
    notifyListeners();
    return FTheme.lightTheme;
  }
}
