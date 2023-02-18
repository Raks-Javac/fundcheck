import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/validators/f_validators.dart';

final registerProvider = StateNotifierProvider((ref) {
  return RegisterProvider(OpenAccountValidator());
});

class RegisterProvider extends StateNotifier<OpenAccountValidator> {
  RegisterProvider(super.state);

  static bool buttonEnabled = false;
  bool get enableButtonGetter => buttonEnabled;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  static bool firstNameVal = false;
  bool get firstNameValGetter => firstNameVal;
  static bool lastNameVal = false;
  bool get lastNameValGetter => lastNameVal;
  static bool emailVal = false;
  bool get emailValGetter => emailVal;
  static bool phoneNumberVal = false;
  bool get phoneNumberValGetter => phoneNumberVal;

  void checkTextField(String currentInputtedValue) {
    firstNameIsValidated(currentInputtedValue);
    emailIsValidated(currentInputtedValue);
  }

  //validate and bool check

  firstNameIsValidated(String val) {
    bool checker = FCheckValidator.validateName(val) == null ? true : false;
    if (checker == true) {
      state = OpenAccountValidator(firstName: true);
      firstNameVal = state.firstName;
    } else {
      state = OpenAccountValidator(firstName: false);
      firstNameVal = state.firstName;
    }
  }

  lastNameIsValidated(String val) {
    bool checker = FCheckValidator.validateName(val) == null ? true : false;
    if (checker == true) {
      state = OpenAccountValidator(lastname: true);
      lastNameVal = state.lastname;
    } else {
      state = OpenAccountValidator(lastname: false);
      lastNameVal = state.lastname;
    }
  }

  emailIsValidated(String val) {
    bool checker = FCheckValidator.validateEmail(val) == null ? true : false;
    if (checker == true) {
      state = OpenAccountValidator(email: true);
      emailVal = state.email;
    } else {
      state = OpenAccountValidator(email: false);
      emailVal = state.email;
    }
  }

  bool numberIsValidated(String val) {
    return FCheckValidator.validatePhoneNumber(val) == null ? true : false;
  }
}

class OpenAccountValidator {
  bool firstName;
  bool lastname;
  bool email;
  bool phoneNumber;
  bool button;
  bool get firstNameGetter {
    return firstName;
  }

  OpenAccountValidator(
      {this.email = false,
      this.firstName = false,
      this.lastname = false,
      this.phoneNumber = false,
      this.button = false});
}
