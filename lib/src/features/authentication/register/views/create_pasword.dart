// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../..re/navigation/navigation_helpers.dart';
// import '../../../../core/utils/extensions.dart';
// import '../../../../shared/res/res.dart';
// import '../../../../shared/res/ui_helper.dart';
// import '../../../../shared/widgets/app_bar/primary_app_bar.dart';
// import '../../../../shared/widgets/buttons/primary_button.dart';
// import '../../../../shared/widgets/render_svg.dart/render_icon.dart';
// import '../../../../shared/widgets/textfield/auth_textfield.dart';
// import '../../widget/check_validate.dart';
// import 'success_reg.dart';

// class CreatePassword extends StatefulWidget {
//    const CreatePassword({super.key});

//   @override
//   State<CreatePassword> createState() => _CreatePasswordState();
// }

// class _CreatePasswordState extends State<CreatePassword> {
//   final TextEditingController _passwordController1 = TextEditingController();

//   final TextEditingController _passwordController2 = TextEditingController();

//   bool _obscure1 = true;

//   bool _obscure2 = true;

//   bool _opacityEnabled = false;

//   void toggle1() {
//     setState(() {
//       _obscure1 = !_obscure1;
//     });
//   }

//   void toggle2() {
//     setState(() {
//       _obscure2 = !_obscure2;
//     });
//   }

//   void checkOpacity() {
//     setState(() {
//       if (_passwordController1.text.isNotEmpty &&
//           _passwordController2.text.isNotEmpty) {
//         _opacityEnabled = true;
//       } else {
//         _opacityEnabled = false;
//       }
//     });
//   }

//   bool isPasswordLength = false;

//    bool hasPasswordOneNumber = false;

//    bool specialCharacter = false;

//    bool equalPassword = false;

//    bool passwordCheck = false;

//   String password = '';

//   String confirmPassword = '';

//   onPasswordChange(String password){
//     final numRegex = RegExp(r'[0-9]');
//     final alphabetRegex = RegExp(r'[A-Z]');
//     final specialRegex = RegExp(r'\W');

//     setState(() {
//        isPasswordLength = false;
//       if(password.length >= 6){
//         isPasswordLength = true;
//       }
//       hasPasswordOneNumber = false;
//       if(numRegex.hasMatch(password) && alphabetRegex.hasMatch(password)){
//         hasPasswordOneNumber = true;
//       }
//       specialCharacter = false;
//       if(specialRegex.hasMatch(password)){
//         specialCharacter = true;
//       }
//       equalPassword = false;
//      if(password == confirmPassword){
//        equalPassword = true;
//      }
//     });
//   }

//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Column(
//         children: [
//           addVertSpace(20),
//           FWidgetsPrimaryAppBar(
//             title: "Create password",
//             leadingIcon: IconButton(
//               onPressed: () {
//                 FNavigator.popSheet();
//               },
//               icon: FWidgetsRenderSvg(
//                 iconColor: context.theme.textTheme.bodyLarge?.color,
//                 iconPath: FIcons.cancel,
//                 height: 30,
//                 width: 30,
//               ),
//             ),
//           ),
//           Expanded(
//             child: Container(
//               padding: const EdgeInsets.only(
//                   left: 20, right: 20, top: 20, bottom: 30),
//               child: Column(
//                 children: [
//                   FAuthTField(
//                     label: 'Password',
//                     isFieldValidated: _opacityEnabled,
//                     useOpacityForValidation: true,
//                     obscureText: _obscure1,
//                     textEditingController: _passwordController1,
//                     // validator: (val) {
//                     //   if (val == null || val.isEmpty) {
//                     //     return 'Please enter a password';
//                     //   }
//                     //   if (val.length < 6) {
//                     //     return 'Password must be 6 character';
//                     //   }
//                     //   return null;
//                     // },
//                     onChanged: (value) {
//                       checkOpacity();
//                       onPasswordChange(value);
//                       setState(() {
//                         confirmPassword = value!;
//                       });
//                     },
//                     hintText: 'Enter your password',
//                     suffixIcon: GestureDetector(
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: GestureDetector(
//                           onTap: () {
//                             toggle1();
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text('Show',
//                                 style: context.theme.textTheme.bodyMedium!
//                                     .copyWith(fontWeight: FontWeight.bold)),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   addVertSpace(20),
//                   FAuthTField(
//                     useOpacityForValidation: true,
//                     isFieldValidated: _opacityEnabled,
//                     label: 'Confirm Password',
//                     obscureText: _obscure2,
//                     textEditingController: _passwordController2,
//                     hintText: 'Enter your password',
//                     // validator: (val) {
//                     //   if (val == null || val.isEmpty) {
//                     //     return 'Please enter a password';
//                     //   }
//                     //   if (val.length < 6) {
//                     //     return 'Password must be 6 character';
//                     //   }
//                     //   return null;
//                     // },
//                     // onSaved: (val){
//                     //   confirmPassword = val!;
//                     // },
//                     onChanged: (val) {
//                       checkOpacity();
//                       onPasswordChange(val);
//                       setState(() {
//                         password = val!;
//                       });
//                     },
//                     suffixIcon: GestureDetector(
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: GestureDetector(
//                           onTap: () {
//                             toggle2();
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text('Show',
//                                 style: context.theme.textTheme.bodyMedium!
//                                     .copyWith(fontWeight: FontWeight.bold)),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   addVertSpace(20),
//                   Row(
//                     children: [
//                       Image.asset(
//                         'assets/images/info-circle.png',
//                         height: 17.sp,
//                       ),
//                       addHorizonSpace(7),
//                       Text(
//                         'Your password must have:',
//                         style: context.theme.textTheme.bodyMedium!
//                             .copyWith(color: FColors.primaryOrange),
//                       )
//                     ],
//                   ),
//                   addVertSpace(15),
//                   ValPassword(
//                     theme: context.theme,
//                     label: 'Six characters',
//                     borderColor: isPasswordLength
//                         ? Colors.transparent
//                         : FColors.primaryGrey,
//                         checkColor: isPasswordLength ? FColors.white
//                         : Colors.transparent,
//                     color: isPasswordLength
//                         ? FColors.primaryGreen
//                         : Colors.transparent,
//                   ),
//                   addVertSpace(10),
//                   ValPassword(
//                     theme: context.theme,
//                     borderColor: hasPasswordOneNumber
//                         ? Colors.transparent
//                         : FColors.primaryGrey,
//                     label: 'One alphabet and number',
//                     checkColor: hasPasswordOneNumber ? FColors.white
//                         : Colors.transparent,
//                     color: hasPasswordOneNumber
//                         ? FColors.primaryGreen
//                         : Colors.transparent,
//                   ),
//                   addVertSpace(10),
//                   ValPassword(
//                     theme: context.theme,
//                     borderColor: hasPasswordOneNumber
//                         ? Colors.transparent
//                         : FColors.primaryGrey,
//                     checkColor: hasPasswordOneNumber ? FColors.white
//                         : Colors.transparent,
//                     label: 'One upper case and lower case alphabet',
//                     color: hasPasswordOneNumber
//                         ? FColors.primaryGreen
//                         : Colors.transparent,
//                   ),
//                   addVertSpace(10),
//                   ValPassword(
//                     theme: context.theme,
//                    borderColor: specialCharacter
//                         ? Colors.transparent
//                         : FColors.primaryGrey,
//                     label: 'One special character(@ # \$ *)',
//                     checkColor: specialCharacter ? FColors.white
//                         : Colors.transparent,
//                     color: specialCharacter
//                         ? FColors.primaryGreen
//                         : Colors.transparent,
//                   ),
//                   addVertSpace(10),
//                   ValPassword(
//                     theme: context.theme,
//                     borderColor: equalPassword
//                         ? Colors.transparent
//                         : FColors.primaryGrey,
//                     label: 'Equal password and confirm password',
//                     checkColor: equalPassword ? FColors.white
//                         : Colors.transparent,
//                     color: equalPassword
//                         ? FColors.primaryGreen
//                         : Colors.transparent,
//                   ),
//                   const Spacer(),
//                   Opacity(
//                     opacity: _opacityEnabled ? 1 : 0.5,
//                     child: FWIdgetsPrimaryButton(
//                         isEnabled: true,
//                         buttonTitle: 'Create account',
//                         onPressed: (){
//                             _opacityEnabled && equalPassword
//                                 ? FNavigator.displayBottomSheet(
//                                     context, const SuccessView())
//                                 : null;

//                         }),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fundcheck/src/features/authentication/register/provider/password_provider.dart';
import 'package:fundcheck/src/features/authentication/widget/check_validate.dart';

import '../../../../core/navigation/navigation_helpers.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../shared/res/res.dart';
import '../../../../shared/res/ui_helper.dart';
import '../../../../shared/widgets/app_bar/primary_app_bar.dart';
import '../../../../shared/widgets/render_svg.dart/render_icon.dart';
import '../../../../shared/widgets/textfield/auth_textfield.dart';

class CreatePassword extends ConsumerWidget {
  const CreatePassword({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passwordNotifier = ref.watch(passwordProvider);
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
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 30),
              child: Column(
                children: [
                  FAuthTField(
                    label: 'Password',
                    // isFieldValidated: _opacityEnabled,
                    useOpacityForValidation: true,
                    obscureText: passwordNotifier.togglePassword1,
                    textEditingController: ref.watch(passwordProvider.notifier).password1Controller,
                    onChanged: (value) {
                      ref.watch(passwordProvider.notifier).onPasswordChange(value);
                       passwordNotifier.seconPass = value!;
                    },
                    hintText: 'Enter your password',
                    suffixIcon: GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: ()=> ref.read(passwordProvider.notifier).toggleFirstPassword(),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              passwordNotifier.togglePassword1 ? 'Show' : 'Hide',
                                style: context.theme.textTheme.bodyMedium!
                                    .copyWith(fontWeight: FontWeight.bold, color: FColors.primaryGrey),
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  addVertSpace(20),
                   FAuthTField(
                    label: 'Confirm Password',
                    // isFieldValidated: _opacityEnabled,
                    useOpacityForValidation: true,
                    obscureText: passwordNotifier.togglePassword2,
                    textEditingController: ref.watch(passwordProvider.notifier).password2Controller,
                    onChanged: (value) {
                      ref
                          .read(passwordProvider.notifier)
                          .onPasswordChange(value);
                       // passwordNotifier.firstPass = value!;
                    },
                    hintText: 'Enter your password',
                    suffixIcon: GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: ()=> ref.read(passwordProvider.notifier).toggleSecondPassword(),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              passwordNotifier.togglePassword2 ? 'Show' : 'Hide',
                                style: context.theme.textTheme.bodyMedium!
                                    .copyWith(fontWeight: FontWeight.bold, color: FColors.primaryGrey),
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  addVertSpace(20),
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
                    borderColor: passwordNotifier.isPasswordLength
                        ? Colors.transparent
                        : FColors.primaryGrey,
                    checkColor: passwordNotifier.isPasswordLength
                        ? FColors.white
                        : Colors.transparent,
                    color: passwordNotifier.isPasswordLength
                        ? FColors.primaryGreen
                        : Colors.transparent,
                  ),
                  addVertSpace(10),
                  ValPassword(
                    theme: context.theme,
                    borderColor: passwordNotifier.hasPasswordOneNumber
                        ? Colors.transparent
                        : FColors.primaryGrey,
                    label: 'One alphabet and number',
                    checkColor: passwordNotifier.hasPasswordOneNumber
                        ? FColors.white
                        : Colors.transparent,
                    color: passwordNotifier.hasPasswordOneNumber
                        ? FColors.primaryGreen
                        : Colors.transparent,
                  ),
                  addVertSpace(10),
                  ValPassword(
                    theme: context.theme,
                    borderColor: passwordNotifier.hasPasswordOneNumber
                        ? Colors.transparent
                        : FColors.primaryGrey,
                    checkColor: passwordNotifier.hasPasswordOneNumber
                        ? FColors.white
                        : Colors.transparent,
                    label: 'One upper case and lower case alphabet',
                    color: passwordNotifier.hasPasswordOneNumber
                        ? FColors.primaryGreen
                        : Colors.transparent,
                  ),
                  addVertSpace(10),
                  ValPassword(
                    theme: context.theme,
                    borderColor: passwordNotifier.specialCharacter
                        ? Colors.transparent
                        : FColors.primaryGrey,
                    label: 'One special character(@ # \$ *)',
                    checkColor: passwordNotifier.specialCharacter
                        ? FColors.white
                        : Colors.transparent,
                    color: passwordNotifier.specialCharacter
                        ? FColors.primaryGreen
                        : Colors.transparent,
                  ),
                  addVertSpace(10),
                  ValPassword(
                    theme: context.theme,
                    borderColor: passwordNotifier.equalPassword
                        ? Colors.transparent
                        : FColors.primaryGrey,
                    label: 'Equal password and confirm password',
                    checkColor: passwordNotifier.equalPassword
                        ? FColors.white
                        : Colors.transparent,
                    color: passwordNotifier.equalPassword
                        ? FColors.primaryGreen
                        : Colors.transparent,
                  ),
                  // const Spacer(),
                  // FWIdgetsPrimaryButton(
                  //     isEnabled: true,
                  //     buttonTitle: 'Create account',
                  //     onPressed: () {
                  //       passwordNotifier.specialCharacter
                  //           //    _opacityEnabled && equalPassword
                  //           ? FNavigator.displayBottomSheet(
                  //               context, const SuccessView())
                  //           : () {};
                  //     })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
