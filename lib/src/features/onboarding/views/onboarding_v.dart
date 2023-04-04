import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fundcheck/src/core/utils/extensions.dart';
import 'package:fundcheck/src/features/authentication/login/views/login_v.dart';
import 'package:fundcheck/src/shared/res/res.dart';
import 'package:fundcheck/src/shared/res/theme/provider/theme/theme_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/navigation/navigation_helpers.dart';
import '../../../shared/res/gap.dart';
import '../../../shared/widgets/buttons/bordered_buttton.dart';
import '../../../shared/widgets/buttons/primary_button.dart';
import '../../authentication/register/views/open_account.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  // ref.watch(themeProvider);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Builder(builder: (context) {
        Provider.of<ThemeProvider>(context);
        final themeNotifier = context.watch<ThemeProvider>();
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "OnBoarding",
                      style: context.theme.textTheme.bodyMedium,
                    ),
                    CupertinoSwitch(
                      value: themeNotifier.mode == AppThemeEnum.light
                          ? true
                          : false,
                      onChanged: (val) {
                        themeNotifier.changeIfBool(val);
                      },
                      thumbColor: FColors.white,
                      trackColor: context.theme.primaryColor,
                      activeColor: context.theme.primaryColor,
                    )
                  ],
                ),
                addVerticalSpacing(70),
                // FPrimaryButton(onClick: (){}, label: 'Open an account',),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: FWIdgetsPrimaryButton(
                      isEnabled: true,
                      buttonTitle: 'Open an account',
                      onPressed: () =>
                          FNavigator.navigateToRoute(const OpenAccount())),
                ),
                addVerticalSpacing(10),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: FWidgetsBorderedButton(
                        buttonTitle: "Log in",
                        onPressed: () {
                          FNavigator.navigateToRoute(const LoginView());
                        }))
              ],
            ),
          ),
        );
      }),
    );
  }
}
