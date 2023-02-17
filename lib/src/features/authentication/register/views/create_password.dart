import 'package:flutter/material.dart';

import '../../../../core/navigation/navigation_helpers.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../shared/res/res.dart';
import '../../../../shared/res/ui_helper.dart';
import '../../../../shared/widgets/app_bar/primary_app_bar.dart';
import '../../../../shared/widgets/buttons/primary_button.dart';
import '../../../../shared/widgets/render_svg.dart/render_icon.dart';
import '../../../../shared/widgets/textfield/auth_textfield.dart';
import '../../widget/check_validate.dart';
import 'success_reg.dart';

class CreatePassword extends StatefulWidget {
  const CreatePassword({super.key});

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  final TextEditingController _passwordController1 = TextEditingController();

  final TextEditingController _passwordController2 = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _obscure1 = true;
  bool _obscure2 = true;
  bool _opacityEnabled = false;

  void toggle1() {
    setState(() {
      _obscure1 = !_obscure1;
    });
  }

  void toggle2() {
    setState(() {
      _obscure2 = !_obscure2;
    });
  }

  void checkOpacity() {
    setState(() {
      if (_passwordController1.text.isNotEmpty &&
          _passwordController2.text.isNotEmpty) {
        _opacityEnabled = true;
      } else {
        _opacityEnabled = false;
      }
    });
  }

  String password = '';
  String confirmPassword = '';
  bool isPasswordLength = false;
  bool hasPasswordOneNumber = false;
  bool specialCharacter = false;
  bool equalPassword = false;
  bool passwordCheck = false;

  onPasswordChange(String password) {
    final numRegex = RegExp(r'[0-9]');
    final alphabetRegex = RegExp(r'[A-Z]');
    final specialRegex = RegExp(r'\W');

    setState(() {
      isPasswordLength = false;
      if (password.length >= 6) {
        isPasswordLength = true;
      }
      hasPasswordOneNumber = false;
      if (numRegex.hasMatch(password) && alphabetRegex.hasMatch(password)) {
        hasPasswordOneNumber = true;
      }
      specialCharacter = false;
      if (specialRegex.hasMatch(password)) {
        specialCharacter = true;
      }
      passwordCheck = false;
      if (confirmPassword == password) {
        passwordCheck = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          addVertSpace(20),
          FWidgetsPrimaryAppBar(
            title: "Create password",
            leadingIcon: IconButton(
              onPressed: () {
                FNavigator.popSheet();
              },
              icon: FWidgetsRenderSvg(
                iconColor: context.theme.textTheme.bodyLarge?.color,
                iconPath: FIcons.cancel,
                height: 30,
                width: 30,
              ),
            ),
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 30),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    FAuthTField(
                      label: 'Password',
                      isFieldValidated: _opacityEnabled,
                      useOpacityForValidation: true,
                      obscureText: _obscure1,
                      textEditingController: _passwordController1,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please enter a password';
                        }
                        if (val.length < 6) {
                          return 'Password must be 6 character';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        checkOpacity();
                        onPasswordChange(value);
                        setState(() {
                          password = value!;
                        });
                      },
                      hintText: 'Enter your password',
                      suffixIcon: GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              toggle1();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Show',
                                  style: context.theme.textTheme.bodyMedium!
                                      .copyWith(fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    addVertSpace(20),
                    FAuthTField(
                      useOpacityForValidation: true,
                      isFieldValidated: _opacityEnabled,
                      label: 'Password',
                      obscureText: _obscure2,
                      textEditingController: _passwordController2,
                      hintText: 'Enter your password',
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please enter a password';
                        }
                        if (val.length < 6) {
                          return 'Password must be 6 character';
                        }
                        return null;
                      },
                      // onSaved: (val){
                      //   confirmPassword = val!;
                      // },
                      onChanged: (val) {
                        checkOpacity();
                        onPasswordChange(val);
                        setState(() {
                          password = val!;
                        });
                      },
                      suffixIcon: GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              toggle2();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Show',
                                  style: context.theme.textTheme.bodyMedium!
                                      .copyWith(fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    addVertSpace(20),
                    Column(
                      children: [
                        ValPassword(
                          theme: context.theme,
                          label: 'Six characters',
                          color: isPasswordLength
                              ? FColors.primaryGreen
                              : Colors.transparent,
                        ),
                        ValPassword(
                          theme: context.theme,
                          label: 'One alphabet and number',
                          color: hasPasswordOneNumber
                              ? FColors.primaryGreen
                              : Colors.transparent,
                        ),
                        ValPassword(
                          theme: context.theme,
                          label: 'One upper case and lower case alphabet',
                          color: hasPasswordOneNumber
                              ? FColors.primaryGreen
                              : Colors.transparent,
                        ),
                        ValPassword(
                          theme: context.theme,
                          label: 'One special character(@ # \$ *)',
                          color: specialCharacter
                              ? FColors.primaryGreen
                              : Colors.transparent,
                        ),
                        ValPassword(
                          theme: context.theme,
                          label: 'Equal password and confirm password',
                          color: passwordCheck
                              ? FColors.primaryGreen
                              : Colors.transparent,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Opacity(
                      opacity: _opacityEnabled ? 1 : 0.5,
                      child: FWIdgetsPrimaryButton(
                          isEnabled: true,
                          buttonTitle: 'Create account',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _opacityEnabled
                                  ? FNavigator.displayBottomSheet(
                                      context, SuccessView())
                                  : null;
                            }
                          }),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
