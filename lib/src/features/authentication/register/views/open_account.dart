import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/navigation/navigation_helpers.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/validators/f_validators.dart';
import '../../../../shared/res/res.dart';
import '../../../../shared/res/ui_helper.dart';
import '../../../../shared/widgets/app_bar/primary_app_bar.dart';
import '../../../../shared/widgets/buttons/primary_button.dart';
import '../../../../shared/widgets/render_svg.dart/render_icon.dart';
import '../../../../shared/widgets/textfield/auth_textfield.dart';
import '../provider/fade_provider.dart';
import 'verify_email.dart';

class OpenAccount extends ConsumerWidget {
  const OpenAccount({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(registerProvider);
    final registerNotifier = ref.watch(registerProvider.notifier);
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const FWidgetsPrimaryAppBar(
            title: "Open an account",
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 30, bottom: 70),
              child: Column(
                children: [
                  FAuthTField(
                    useOpacityForValidation: true,
                    isFieldValidated: registerNotifier.enableButtonGetter,
                    label: 'First name',
                    hintText: 'Enter your first name',
                    textEditingController: registerNotifier.firstNameController,
                    validator: (value) => FCheckValidator.validateName(value!),
                    onChanged: (val) {
                      registerNotifier.checkTextField(val);
                    },
                  ),
                  addVertSpace(20),
                  FAuthTField(
                    isFieldValidated: registerNotifier.enableButtonGetter,
                    useOpacityForValidation: true,
                    label: 'Last name',
                    hintText: 'Enter your first name',
                    textEditingController: registerNotifier.lastNameController,
                    onChanged: (val) {
                      registerNotifier.checkTextField(val);
                    },
                    validator: (value) => FCheckValidator.validateName(value!),
                  ),
                  addVertSpace(20),
                  FAuthTField(
                    isFieldValidated: registerNotifier.enableButtonGetter,
                    useOpacityForValidation: true,
                    label: 'Email address',
                    hintText: 'fundcheck@gmail.com',
                    textEditingController: registerNotifier.emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => FCheckValidator.validateEmail(value!),
                    onChanged: (val) {
                      registerNotifier.checkTextField(val);
                    },
                  ),
                  addVertSpace(20),
                  FAuthTField(
                    isFieldValidated: registerNotifier.enableButtonGetter,
                    useOpacityForValidation: true,
                    label: 'Phone number',
                    hintText: 'Enter your phone number',
                    textEditingController: registerNotifier.phoneController,
                    keyboardType: TextInputType.number,
                    validator: (val) =>
                        FCheckValidator.validatePhoneNumber(val!),
                    onChanged: (val) {
                      registerNotifier.checkTextField(val);
                    },
                  ),
                  const Spacer(),
                  FWIdgetsPrimaryButton(
                    buttonTitle: 'Continue',
                    isEnabled: registerNotifier.enableButtonGetter,
                    onPressed: () {
                      if (registerNotifier.enableButtonGetter == true) {
                        FNavigator.displayBottomSheet(context, VerifyEmail());
                      }
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
