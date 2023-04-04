import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fundcheck/src/core/navigation/navigation_helpers.dart';
import 'package:fundcheck/src/shared/res/theme/provider/theme/theme_provider.dart';
import 'package:provider/provider.dart';

// import 'package:flutter';

import 'src/app_level_locator/provider_locator.dart';
import 'src/features/onboarding/views/onboarding_v.dart';
import 'src/shared/res/res.dart';

void main() {
  runApp(const FundCheckApp());
}

class FundCheckApp extends StatelessWidget {
  const FundCheckApp({super.key});
  // const ref.watch(themeProvider, {super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return MultiProvider(
      providers: appProvider(),
      child: ScreenUtilInit(
          minTextAdapt: true,
          builder: (context, child) {
            Provider.of<ThemeProvider>(context, listen: false);
            return MaterialApp(
              title: FStrings.appName,
              navigatorKey: FNavigator.navigatorKey,
              scaffoldMessengerKey: FNavigator.scaffoldMessengerKey,
              debugShowCheckedModeBanner: false,
              theme: context.watch<ThemeProvider>().returnThemeBasedOnMode(),
              home: const OnBoardingView(),
            );
          }),
    );
  }
}
