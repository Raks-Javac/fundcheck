//this file would container all providers that are of app level

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundcheck/src/shared/res/theme/provider/theme/theme_provider.dart';

final themeProvider = StateNotifierProvider((ref) {
  return ThemeProvider(AppThemeMode.light);
});

// final fadeProvider = StateNotifierProvider((ref){
//   return FadeProvider()
// })