import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/app_level_locator/provider_locator.dart';
import 'src/features/onboarding/views/onboarding_v.dart';
import 'src/shared/res/res.dart';

void main() {
  runApp(const ProviderScope(child: FundCheckApp()));
}

class FundCheckApp extends ConsumerWidget {
  const FundCheckApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, ref) {
    ref.watch(themeProvider);
    return MaterialApp(
      title: FStrings.appName,
      theme: ref.watch(themeProvider.notifier).returnThemeBasedOnMode(),
      home: const OnBoardingView(),
    );
  }
}
