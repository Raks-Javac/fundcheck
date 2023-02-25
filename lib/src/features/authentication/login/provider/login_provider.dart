import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundcheck/src/core/utils/validators/f_validators.dart';

final loginProvider = AutoDisposeStateNotifierProvider((ref) {
  return LoginProvider();
});

class LoginProvider extends StateNotifier<LoginInterface> {
  LoginProvider() : super(LoginInterface());
  final TextEditingController emailPhoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  static bool emailPhoneNumVal = false;
  bool get emailPhoneValGetter => emailPhoneNumVal;
  static bool passwordVal = false;
  bool get passwordValGetter => passwordVal;
  static bool showPassword = false;
  bool get showPasswordGetter => showPassword;

  static bool buttonEnabled = false;
  bool get enableButtonGetter => buttonEnabled;

  togglePasswordField() {
    state = state.copyWith(showPasswordCopy: !showPassword);
    showPassword = state.showPassword!;
  }

  enableEmailField(String val) {
    bool check =
        FCheckValidator().validatePhoneNumberEmail(val) == null ? true : false;
    if (check) {
      state = state.copyWith(emailPhoneNumberCopy: true);
      emailPhoneNumVal = state.emailPhoneNumber!;
    } else {
      state = state.copyWith(emailPhoneNumberCopy: false);
      emailPhoneNumVal = state.emailPhoneNumber!;
    }
    checkTextField();
  }

  enablePasswordField(String val) {
    bool check =
        FCheckValidator.validateNormalPassword(val) == null ? true : false;
    if (check) {
      state = state.copyWith(passwordCopy: true);
      passwordVal = state.password!;
    } else {
      state = state.copyWith(passwordCopy: false);
      passwordVal = state.password!;
    }
    checkTextField();
  }

  void checkTextField() {
    if (emailPhoneNumVal && passwordVal) {
      buttonEnabled = true;
    } else {
      buttonEnabled = false;
    }
  }
}

class LoginInterface {
  bool? emailPhoneNumber;
  bool? password;
  bool? isButtonEnabled;
  bool? showPassword;
  LoginInterface({
    this.isButtonEnabled,
    this.emailPhoneNumber,
    this.password,
    this.showPassword,
  });

  LoginInterface copyWith({
    bool? emailPhoneNumberCopy,
    bool? passwordCopy,
    bool? isButtonEnabledCopy,
    bool? showPasswordCopy,
  }) {
    return LoginInterface(
      isButtonEnabled: isButtonEnabledCopy ?? isButtonEnabled,
      emailPhoneNumber: emailPhoneNumberCopy ?? emailPhoneNumber,
      password: passwordCopy ?? password,
      showPassword: showPasswordCopy ?? showPassword,
    );
  }
}
