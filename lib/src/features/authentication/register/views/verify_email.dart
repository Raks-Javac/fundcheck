import 'package:flutter/material.dart';

import '../../../../core/navigation/navigation_helpers.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../shared/res/ui_helper.dart';
import '../../../../shared/widgets/buttons/primary_button.dart';
import '../../../../shared/widgets/textfield/auth_textfield.dart';
import 'create_password.dart';

class VerifyEmail extends StatelessWidget {
  VerifyEmail({super.key});

  final TextEditingController _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(context) / 1.5,
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
      child: Column(
        children: [
          FNavigator.dividerModelSheet(),
          //    addVertSpace(260),
          Text(
            'Email verification',
            style: context.theme.textTheme.bodyLarge!
                .copyWith(fontWeight: FontWeight.bold),
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
            textEditingController: _otpController,
          ),
          addVertSpace(15),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text('Resend Code',
                style: context.theme.textTheme.bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold)),
          ),
          const Spacer(),
          FWIdgetsPrimaryButton(
            isEnabled: true,
            buttonTitle: 'Continue',
            onPressed: () {
              FNavigator.navigateToRoute(const CreatePassword());
              // Navigator.pop(context);
            },
            icon: Image.asset(
              'assets/images/arrow-right.png',
            ),
          )
        ],
      ),
    );
  }
}
