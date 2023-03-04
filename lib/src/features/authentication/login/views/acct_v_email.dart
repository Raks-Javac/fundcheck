import 'package:flutter/material.dart';
import 'package:fundcheck/src/features/authentication/login/views/acct_v_code.dart';

import '../../../../core/navigation/navigation_helpers.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../shared/res/res.dart';
import '../../../../shared/res/ui_helper.dart';
import '../../../../shared/widgets/buttons/primary_button.dart';
import '../../../../shared/widgets/render_svg.dart/render_icon.dart';
import '../../../../shared/widgets/textfield/auth_textfield.dart';

class AccountVerifyEmail extends StatelessWidget {
  AccountVerifyEmail({super.key});

  final TextEditingController _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(context) / 1.5,
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
      child: Column(
        children: [
          addVertSpace(5),
          Stack(
            children: [
              SizedBox(
                height: 25,
                width: 25,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    FNavigator.popSheet();
                  },
                  icon: Align(
                    alignment: Alignment.topLeft,
                    child: FWidgetsRenderSvg(
                      iconColor: context.theme.textTheme.bodyLarge?.color,
                      iconPath: FIcons.cancel,
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Account verification',
                  style: context.theme.textTheme.bodyLarge!
                      .copyWith(fontFamily: FStrings.monteserratSemiBold),
                ),
              ),
            ],
          ),
          addVertSpace(25),
          Text(
              'We need to verify that you own this account, please enter your email address to continue with your password reset.',
              style: context.theme.textTheme.bodyMedium),
          addVertSpace(30),
          FAuthTField(
            isFieldValidated: true,
            useOpacityForValidation: false,
            label: 'Email address',
            hintText: "example@gmail.com",
            textEditingController: _otpController,
          ),
          const Spacer(),
          FWIdgetsPrimaryButton(
            isEnabled: true,
            buttonTitle: 'Continue',
            onPressed: () {
              FNavigator.popSheet();
              FNavigator.displayBottomSheet(context, AccountVerifyCode());
            },
            icon: const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Center(
                child: FWidgetsRenderSvg(
                  iconColor: FColors.white,
                  iconPath: FIcons.arrowRight,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
