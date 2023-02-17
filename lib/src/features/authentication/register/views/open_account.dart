import 'package:flutter/material.dart';

import '../../../../core/navigation/navigation_helpers.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/validators/f_validators.dart';
import '../../../../shared/res/res.dart';
import '../../../../shared/res/ui_helper.dart';
import '../../../../shared/widgets/app_bar/primary_app_bar.dart';
import '../../../../shared/widgets/buttons/primary_button.dart';
import '../../../../shared/widgets/render_svg.dart/render_icon.dart';
import '../../../../shared/widgets/textfield/auth_textfield.dart';
import 'verify_email.dart';

class OpenAccount extends StatefulWidget {
  const OpenAccount({super.key});

  @override
  State<OpenAccount> createState() => _OpenAccountState();
}

class _OpenAccountState extends State<OpenAccount> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool _isButtonEnabled = false;

  void _checkTextField() {
    setState(() {
      if (_firstNameController.text.isNotEmpty &&
          _lastNameController.text.isNotEmpty &&
          _emailController.text.isNotEmpty &&
          _phoneController.text.isNotEmpty) {
        _isButtonEnabled = true;
      } else {
        _isButtonEnabled = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    isFieldValidated: _isButtonEnabled,
                    label: 'First name',
                    hintText: 'Enter your first name',
                    textEditingController: _firstNameController,
                    validator: (value) => FCheckValidator.validateName(value!),
                    onChanged: (_) {
                      _checkTextField();
                    },
                  ),
                  addVertSpace(20),
                  FAuthTField(
                    isFieldValidated: _isButtonEnabled,
                    useOpacityForValidation: true,
                    label: 'Last name',
                    hintText: 'Enter your first name',
                    textEditingController: _lastNameController,
                    onChanged: (_) {
                      _checkTextField();
                    },
                    validator: (value) => FCheckValidator.validateName(value!),
                  ),
                  addVertSpace(20),
                  Opacity(
                    opacity: _isButtonEnabled ? 1 : 0.5,
                    child: FAuthTField(
                      isFieldValidated: _isButtonEnabled,
                      useOpacityForValidation: true,
                      label: 'Email address',
                      hintText: 'fundcheck@gmail.com',
                      textEditingController: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) =>
                          FCheckValidator.validateEmail(value!),
                      onChanged: (_) {
                        _checkTextField();
                      },
                    ),
                  ),
                  addVertSpace(20),
                  FAuthTField(
                    isFieldValidated: _isButtonEnabled,
                    useOpacityForValidation: true,
                    label: 'Phone number',
                    hintText: 'Enter your phone number',
                    textEditingController: _phoneController,
                    keyboardType: TextInputType.number,
                    validator: (val) =>
                        FCheckValidator.validatePhoneNumber(val!),
                    onChanged: (_) {
                      _checkTextField();
                    },
                  ),
                  const Spacer(),
                  Opacity(
                    opacity: _isButtonEnabled ? 1 : 0.5,
                    child: FWIdgetsPrimaryButton(
                      buttonTitle: 'Continue',
                      isEnabled: true,
                      onPressed: () {
                        // _formKey.currentState!.validate();
                        _isButtonEnabled
                            ? FNavigator.displayBottomSheet(
                                context, VerifyEmail())
                            : () {};
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
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
