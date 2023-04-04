import 'package:flutter/material.dart';

import '../../../../core/utils/validators/f_validators.dart';

class RegisterProvider extends ChangeNotifier {
  OpenAccountValidator state = OpenAccountValidator();

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

  void checkTextField() {
    if (firstNameVal && lastNameVal && emailVal && phoneNumberVal) {
      buttonEnabled = true;
    } else {
      buttonEnabled = false;
    }
    notifyListeners();
  }

  //validate and bool check

  firstNameIsValidated(String val) {
    bool checker = FCheckValidator.validateName(val) == null ? true : false;
    if (checker == true) {
      state = state.copyWith(firstName: true);
      firstNameVal = state.firstName!;
    } else {
      state = state.copyWith(firstName: false);
      firstNameVal = state.firstName!;
    }
    checkTextField();
    notifyListeners();
  }

  lastNameIsValidated(String val) {
    bool checker = FCheckValidator.validateName(val) == null ? true : false;
    if (checker == true) {
      state = state.copyWith(lastname: true);
      lastNameVal = state.lastname!;
    } else {
      state = state.copyWith(lastname: false);
      lastNameVal = state.lastname!;
    }
    checkTextField();
    notifyListeners();
  }

  emailIsValidated(String val) {
    bool checker = FCheckValidator.validateEmail(val) == null ? true : false;
    if (checker == true) {
      state = state.copyWith(email: true);
      emailVal = state.email!;
    } else {
      state = state.copyWith(email: false);
      emailVal = state.email!;
    }
    checkTextField();
    notifyListeners();
  }

  numberIsValidated(String val) {
    bool checker =
        FCheckValidator.validatePhoneNumber(val) == null ? true : false;
    if (checker == true) {
      state = state.copyWith(phoneNumber: true);
      phoneNumberVal = state.phoneNumber!;
    } else {
      state = state.copyWith(phoneNumber: false);
      phoneNumberVal = state.phoneNumber!;
    }
    checkTextField();
    notifyListeners();
  }
}

class OpenAccountValidator {
  bool? firstName;
  bool? lastname;
  bool? email;
  bool? phoneNumber;
  bool? button;

  OpenAccountValidator(
      {this.email,
      this.firstName,
      this.lastname,
      this.phoneNumber,
      this.button});

  OpenAccountValidator copyWith({
    bool? firstName,
    bool? lastname,
    bool? email,
    bool? phoneNumber,
    bool? button,
  }) {
    return OpenAccountValidator(
        firstName: firstName ?? this.firstName,
        email: email ?? this.email,
        lastname: lastname ?? this.lastname,
        button: button ?? this.button,
        phoneNumber: phoneNumber ?? this.phoneNumber);
  }
}
