//this file would container all providers that are of app level

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundcheck/src/core/provider/theme/theme_provider.dart';
import 'package:fundcheck/src/features/authentication/provider/fade_provider.dart';

final themeProvider = StateNotifierProvider((ref) {
  return ThemeProvider(AppThemeMode.light);
});

// final fadeProvider = StateNotifierProvider((ref){
//   return FadeProvider()
// })