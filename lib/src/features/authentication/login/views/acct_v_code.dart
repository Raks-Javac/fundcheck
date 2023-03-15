import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fundcheck/src/features/dashboard/bottom_nav/bottom_nav.dart';

import '../../../../core/navigation/navigation_helpers.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../shared/res/res.dart';
import '../../../../shared/res/ui_helper.dart';
import '../../../../shared/widgets/buttons/primary_button.dart';
import '../../../../shared/widgets/render_svg.dart/render_icon.dart';
import '../../../../shared/widgets/textfield/auth_textfield.dart';

class AccountVerifyCode extends StatelessWidget {
  AccountVerifyCode({super.key});

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
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          addVertSpace(25),
          Text(
              'We need to verify your email address so, we sent you a unique code. Please input the correct code to continue to continue with your registration',
              style: context.theme.textTheme.bodyMedium),
          addVertSpace(30),
          FAuthTField(
            isFieldValidated: true,
            useOpacityForValidation: false,
            label: 'Code',
            hintText: "Enter 6-digit unique code",
            textEditingController: _otpController,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: 100,
              child: TextButton(
                style: const ButtonStyle(
                  shadowColor: MaterialStatePropertyAll(Colors.transparent),
                  splashFactory: NoSplash.splashFactory,
                  padding: MaterialStatePropertyAll(EdgeInsets.zero),
                ),
                onPressed: () {},
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Resend code",
                        style: context.theme.textTheme.labelLarge?.copyWith(
                          fontSize: 13.sp,
                          color: context.theme.textTheme.bodyLarge!.color!,
                        ),
                      ),
                      SizedBox(
                          height: 0,
                          width: 85,
                          child: Divider(
                            height: 3,
                            color: context.theme.textTheme.bodyLarge!.color!,
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          FWIdgetsPrimaryButton(
            isEnabled: true,
            buttonTitle: 'Continue',
            onPressed: () {
              FNavigator.navigateAndRemoveUntilRoute(const FCheckNavBar());
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
