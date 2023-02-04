import 'package:flutter/material.dart';

import 'src/features/onboarding/views/onboarding_v.dart';
import 'src/shared/res/res.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: FStrings.appName,
      theme: FTheme.lightTheme,
      home: const OnBoardingView(),
    );
  }
}
