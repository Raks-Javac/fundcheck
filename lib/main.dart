import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fundcheck/src/core/navigation/navigation_helpers.dart';
// import 'package:flutter';

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
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    ref.watch(themeProvider);
    return ScreenUtilInit(
      minTextAdapt: true,
      builder: (context, child){
      return MaterialApp(
      title: FStrings.appName,
      navigatorKey: FNavigator.navigatorKey,
      scaffoldMessengerKey: FNavigator.scaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      theme: ref.watch(themeProvider.notifier).returnThemeBasedOnMode(),
      home: const OnBoardingView(),
    );
    });
  }
}
