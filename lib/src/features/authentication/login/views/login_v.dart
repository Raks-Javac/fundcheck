import 'dart:ffi';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fundcheck/src/core/navigation/navigation_helpers.dart';
import 'package:fundcheck/src/core/utils/validators/f_validators.dart';
import 'package:fundcheck/src/features/authentication/forget_password/views/reset_password.dart';
import 'package:fundcheck/src/features/authentication/login/provider/login_provider.dart';
import 'package:fundcheck/src/features/authentication/login/views/acct_v_email.dart';
import 'package:fundcheck/src/features/authentication/register/views/open_account.dart';

import '../../../../core/utils/extensions.dart';
import '../../../../shared/res/res.dart';
import '../../../../shared/res/ui_helper.dart';
import '../../../../shared/widgets/app_bar/primary_app_bar.dart';
import '../../../../shared/widgets/buttons/primary_button.dart';
import '../../../../shared/widgets/textfield/auth_textfield.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  @override
  void initState() {
    ref.read(loginProvider.notifier).checkDeviceOnInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(loginProvider);
    final loginNotifier = ref.watch(loginProvider.notifier);
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const FWidgetsPrimaryAppBar(
            title: "Log In",
            leadingIcon: SizedBox.shrink(),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 30, bottom: 70),
              child: Column(
                children: [
                  FAuthTField(
                    useOpacityForValidation: true,
                    isFieldValidated: loginNotifier.emailPhoneValGetter,
                    label: 'Email address or Phone number',
                    hintText: 'Enter your email address or Phone number',
                    validator: (val) =>
                        FCheckValidator().validatePhoneNumberEmail(val),
                    textEditingController: loginNotifier.emailPhoneController,
                    onChanged: (val) {
                      loginNotifier.enableEmailField(val);
                    },
                  ),
                  addVertSpace(20),
                  FAuthTField(
                    isFieldValidated: loginNotifier.passwordValGetter,
                    useOpacityForValidation: true,
                    label: 'Password',
                    obscureText: loginNotifier.showPasswordGetter,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          loginNotifier.togglePasswordField();
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              loginNotifier.showPasswordGetter
                                  ? "Show"
                                  : "Hide",
                              style:
                                  context.theme.textTheme.labelLarge?.copyWith(
                                fontSize: 13.sp,
                                color: loginNotifier.passwordValGetter
                                    ? context.theme.textTheme.bodyLarge!.color!
                                    : FColors.primaryGrey,
                              ),
                            ),
                            SizedBox(
                                height: 0,
                                width: 33,
                                child: Divider(
                                  height: 3,
                                  color: loginNotifier.passwordValGetter
                                      ? context
                                          .theme.textTheme.bodyLarge!.color!
                                      : FColors.primaryGrey,
                                )),
                          ],
                        ),
                      ),
                    ),
                    hintText: 'Enter your password',
                    validator: (val) =>
                        FCheckValidator.validateNormalPassword(val!),
                    textEditingController: loginNotifier.passwordController,
                    onChanged: (val) {
                      loginNotifier.enablePasswordField(val);
                    },
                  ),
                  UIHelper.verticalSpaceSmall,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 120,
                      child: TextButton(
                        style: const ButtonStyle(
                          shadowColor:
                              MaterialStatePropertyAll(Colors.transparent),
                          splashFactory: NoSplash.splashFactory,
                          padding: MaterialStatePropertyAll(EdgeInsets.zero),
                        ),
                        onPressed: () {},
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             
                              GestureDetector(
                                onTap: ()=> FNavigator.navigateToRoute(const ResetPassword()),
                                child: Text(
                                  "Forget Password",
                                  style: context.theme.textTheme.labelLarge
                                      ?.copyWith(
                                    fontSize: 13.sp,
                                    color: loginNotifier.passwordValGetter
                                        ? context
                                            .theme.textTheme.bodyLarge!.color!
                                        : FColors.primaryGrey,
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height: 0,
                                  width: 108,
                                  child: Divider(
                                    height: 3,
                                    color: loginNotifier.passwordValGetter
                                        ? context
                                            .theme.textTheme.bodyLarge!.color!
                                        : FColors.primaryGrey,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  UIHelper.verticalSpaceLarge,
                  loginNotifier.enableFaceIDGetter
                      ? Image.asset(
                          FIcons.faceId,
                          width: 48,
                          height: 48,
                        )
                      : Image.asset(
                          FIcons.fingerPrint,
                          width: 48,
                          height: 48,
                        ),
                  const Spacer(),
                  FWIdgetsPrimaryButton(
                    buttonTitle: 'Log In',
                    isEnabled: loginNotifier.enableButtonGetter,
                    onPressed: () {
                      print(loginNotifier.emailPhoneValGetter);
                      if (loginNotifier.enableButtonGetter == true) {
                        FNavigator.displayBottomSheet(
                            context, AccountVerifyEmail());
                      }
                    },
                  ),
                  UIHelper.verticalSpaceSmall,
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: "Don’t have an account ?",
                      style: context.theme.textTheme.labelLarge?.copyWith(
                        fontSize: 12.sp,
                      ),
                    ),
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () =>
                            FNavigator.navigateToRoute(const OpenAccount()),
                      text: "  Register",
                      style: context.theme.textTheme.labelLarge?.copyWith(
                        fontSize: 13.sp,
                        color: FColors.primaryBlue,
                        fontFamily: FStrings.monteserratSemiBold,
                      ),
                    ),
                  ]))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
