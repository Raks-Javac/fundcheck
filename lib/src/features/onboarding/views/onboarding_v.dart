import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app_level_locator/provider_locator.dart';
import '../../../core/provider/theme/theme_provider.dart';
import '../../../shared/res/gap.dart';
import '../../../shared/res/res.dart';
import '../../../shared/widgets/buttons/bordered_buttton.dart';
import '../../../shared/widgets/buttons/primary_button.dart';

class OnBoardingView extends ConsumerWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    ref.watch(themeProvider);
    final theme = Theme.of(context);
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "OnBoarding",
                    style: theme.textTheme.bodyMedium,
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
                    trackColor: theme.primaryColor,
                    activeColor: theme.primaryColor,
                  )
                ],
              ),
              addVerticalSpacing(70),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: FWIdgetsPrimaryButton(
                      buttonTitle: "Open an account", onPressed: () {})),
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
