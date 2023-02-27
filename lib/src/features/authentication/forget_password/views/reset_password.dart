import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fundcheck/src/features/authentication/login/views/login_v.dart';
import 'package:fundcheck/src/shared/widgets/sucess_sheet/success_botttom_sheet.dart';

import '../../../../core/navigation/navigation_helpers.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../shared/res/res.dart';
import '../../../../shared/res/ui_helper.dart';
import '../../../../shared/widgets/app_bar/primary_app_bar.dart';
import '../../../../shared/widgets/buttons/primary_button.dart';
import '../../../../shared/widgets/render_svg.dart/render_icon.dart';
import '../../../../shared/widgets/textfield/auth_textfield.dart';
import '../../widget/check_validate.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
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
            title: "Reset Password",
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
                          padding: const EdgeInsets.only(right: 8.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Show",
                                  style: context.theme.textTheme.labelLarge
                                      ?.copyWith(
                                    fontSize: 13.sp,
                                    fontFamily: FStrings.monteserratSemiBold,
                                    color: context
                                        .theme.textTheme.bodyLarge!.color!,
                                  ),
                                ),
                                SizedBox(
                                    height: 0,
                                    width: 33,
                                    child: Divider(
                                      height: 3,
                                      color: context
                                          .theme.textTheme.bodyLarge!.color!,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    addVertSpace(20),
                    FAuthTField(
                      useOpacityForValidation: true,
                      isFieldValidated: _opacityEnabled,
                      label: 'Confirm password',
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
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Show",
                                style: context.theme.textTheme.labelLarge
                                    ?.copyWith(
                                  fontSize: 13.sp,
                                  fontFamily: FStrings.monteserratSemiBold,
                                  color:
                                      context.theme.textTheme.bodyLarge!.color!,
                                ),
                              ),
                              SizedBox(
                                  height: 0,
                                  width: 33,
                                  child: Divider(
                                    height: 3,
                                    color: context
                                        .theme.textTheme.bodyLarge!.color!,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    addVertSpace(20),
                    Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/info-circle.png',
                              height: 17.sp,
                            ),
                            addHorizonSpace(7),
                            Text(
                              'Your password must have:',
                              style: context.theme.textTheme.bodyMedium!
                                  .copyWith(color: FColors.primaryOrange),
                            )
                          ],
                        ),
                        addVertSpace(15),
                        ValPassword(
                          theme: context.theme,
                          label: 'Six characters',
                          borderColor: isPasswordLength
                              ? Colors.transparent
                              : FColors.primaryGrey,
                              checkColor: isPasswordLength ? FColors.white
                              : Colors.transparent,
                          color: isPasswordLength
                              ? FColors.primaryGreen
                              : Colors.transparent,
                        ),
                        addVertSpace(10),
                        ValPassword(
                          theme: context.theme,
                          borderColor: hasPasswordOneNumber
                              ? Colors.transparent
                              : FColors.primaryGrey,
                          label: 'One alphabet and number',
                          checkColor: hasPasswordOneNumber ? FColors.white
                              : Colors.transparent,
                          color: hasPasswordOneNumber
                              ? FColors.primaryGreen
                              : Colors.transparent,
                        ),
                        addVertSpace(10),
                        ValPassword(
                          theme: context.theme,
                          borderColor: hasPasswordOneNumber
                              ? Colors.transparent
                              : FColors.primaryGrey,
                          label: 'One upper case and lower case alphabet',
                          checkColor: hasPasswordOneNumber ? FColors.white
                              : Colors.transparent,
                          color: hasPasswordOneNumber
                              ? FColors.primaryGreen
                              : Colors.transparent,
                        ),
                        addVertSpace(10),
                        ValPassword(
                          theme: context.theme,
                         borderColor: specialCharacter
                              ? Colors.transparent
                              : FColors.primaryGrey,
                          label: 'One special character(@ # \$ *)',
                          checkColor: specialCharacter ? FColors.white
                              : Colors.transparent,
                          color: specialCharacter
                              ? FColors.primaryGreen
                              : Colors.transparent,
                        ),
                        addVertSpace(10),
                        ValPassword(
                          theme: context.theme,
                          borderColor: equalPassword
                              ? Colors.transparent
                              : FColors.primaryGrey,
                          label: 'Equal password and confirm password',
                          checkColor: equalPassword ? FColors.white
                              : Colors.transparent,
                          color: equalPassword
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
                          buttonTitle: 'Rest password',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _opacityEnabled
                                  ? FNavigator.displayBottomSheet(
                                      context,
                                      SucessBottomSheet(
                                          buttonDescription: "Log in",
                                          onTap: () {
                                            FNavigator
                                                .navigateAndRemoveUntilRoute(
                                                    const LoginView());
                                          },
                                          description:
                                              "Your password has been reset. Please proceed to login"))
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
