
 import 'package:flutter/material.dart';
import 'package:fundcheck/src/core/navigation/navigation_helpers.dart';
import 'package:fundcheck/src/features/authentication/register/views/create_password.dart';
import 'package:fundcheck/src/shared/res/ui_helper.dart';
import 'package:fundcheck/src/shared/textfield/auth_textfield.dart';
import 'package:fundcheck/src/shared/widgets/buttons/primary_button.dart';

class VerifyEmail extends StatelessWidget {
  VerifyEmail({super.key});

  final TextEditingController _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: screenHeight(context) / 1.5,
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
      child: Column(
      
        children: [
          FNavigator.dividerModelSheet(),
          //    addVertSpace(260),
          Text(
            'Email verification',
            style: theme.textTheme.bodyLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          addVertSpace(25),
          Text(
              'We need to verify your email address so, we sent you a unique code. Please input the correct code to continue to continue with your registration',
              style: theme.textTheme.bodyMedium),
               addVertSpace(30),
         const FAuthLabel(label: 'Code'),
          FAuthTField(
            textEditingController: _otpController,
          ),
          addVertSpace(15),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              'Resend Code',
              style: theme.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold)
              
              ),
          ),
          const Spacer(),
          FWIdgetsPrimaryButton(
            buttonTitle: 'Continue',
            onPressed: () {
                   FNavigator.navigateToRoute( CreatePassword());
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