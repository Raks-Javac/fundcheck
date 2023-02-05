import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/res/res.dart';

enum AppThemeMode {
  light,
  dark,
}

class ThemeProvider extends StateNotifier<AppThemeMode> {
  ThemeProvider(super.state);

  AppThemeMode get mode => state;

  changeThemeState(AppThemeMode changeMode) {
    state = changeMode;
  }

  changeIfBool(bool boolMode) {
    if (boolMode == true) {
      state = AppThemeMode.light;
    } else {
      state = AppThemeMode.dark;
    }
  }

  ThemeData? returnThemeBasedOnMode() {
    if (state == AppThemeMode.light) {
      return FTheme.lightTheme;
    }
    if (state == AppThemeMode.dark) {
      return FTheme.darkTheme;
    }
    return FTheme.lightTheme;
  }
}
