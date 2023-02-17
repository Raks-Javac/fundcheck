import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app_level_locator/provider_locator.dart';
import '../../../core/navigation/navigation_helpers.dart';
import '../../../core/utils/extensions.dart';
import '../../../shared/res/gap.dart';
import '../../../shared/res/res.dart';
import '../../../shared/res/theme/provider/theme/theme_provider.dart';
import '../../../shared/widgets/buttons/bordered_buttton.dart';
import '../../../shared/widgets/buttons/primary_button.dart';
import '../../authentication/register/views/open_account.dart';

class OnBoardingView extends ConsumerWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    ref.watch(themeProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
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
                    value: ref.watch(themeProvider.notifier).mode ==
                            AppThemeMode.light
                        ? true
                        : false,
                    onChanged: (val) {
                      ref.watch(themeProvider.notifier).changeIfBool(val);
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
                      buttonTitle: "Log in", onPressed: () {}))
            ],
          ),
        ),
      ),
    );
  }
}
