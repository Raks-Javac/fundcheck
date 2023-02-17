import 'package:flutter/material.dart';

import '../../../../core/navigation/navigation_helpers.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../shared/res/res.dart';
import '../../../../shared/res/ui_helper.dart';
import '../../../../shared/widgets/buttons/primary_button.dart';
import '../../../../shared/widgets/render_svg.dart/render_icon.dart';
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
                  'Email verification',
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
              FNavigator.popSheet();
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0))),
                  builder: (context) => Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: GestureDetector(
                          onTap: dismissKeyboard,
                          child: const CreatePassword())));
              // Navigator.pop(context);
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
