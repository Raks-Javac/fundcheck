
 

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fundcheck/src/shared/validators/input_limit.dart';
import 'package:intl/intl.dart';


class FCheckValidator {
  
  static String getFormattedDate(DateTime date) {
    var formatter = DateFormat('dd MMM yyyy');
    final dateFormatted = formatter.format(date);
    return dateFormatted;
  }

  static String getPostFormattedDate(String date) {
    try {
      DateTime formattedDate = DateFormat("dd MMM yyyy'", "en_US").parse(date);
      var formatter = DateFormat('yyyy-MM-dd');
      final resultDate = formatter.format(formattedDate);
      return resultDate;
    } catch (e) {
      //print(e);
      return date;
    }
  }

  static NumberFormat currency(context) {
  var format =
      NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');
  return format;
}


  static String getFormattedTime(String date) {
    try {
      DateTime formattedDate = DateTime.parse(date);
      String formattedTime = DateFormat.jm().format(formattedDate);
     // print(formattedTime);
      return formattedTime;
    } catch (e) {
    //  print(e);
      return date;
    }
  }

  static int getFormattedAmount(String amount) {
    final amt = amount.replaceAll(RegExp(r'N\s|\,|\.00|NGN|USD|\s+'), "");
    return int.tryParse(amt) ?? 0;
  }

  static String removeCurrencySymbol(String amount) {
    final amt = amount.replaceAll(RegExp(r'N\s|NGN|USD|\s+|\,'), "");
    return amt;
  }

  static double getFormattedAmountDouble(String amount) {
    final amt = amount.replaceAll(RegExp(r'N\s|\,|NGN|USD|\s+'), "");
    return double.parse(amt);
  }

  static bool isPasswordLengthCompliant(String password) {
    return password.length >= GeneralLimits.passwordLength ? true : false;
  }

  static bool containsUpperCase(String password) {
    return password.contains(RegExp(r'[A-Z]')) ? true : false;
  }

  static bool containsSpecialCharater(String password) {
    return password.contains(RegExp(r'\W')) ? true : false;
  }

  static String validatePassword(String password, String confirmPassword) {
    if (password.isEmpty || confirmPassword.isEmpty) {
      return "Passwords cannot be empty";
    }

    if (password.length <= GeneralLimits.passwordLength) {
      return "Password length must be at " +
          GeneralLimits.passwordLength.toString();
    }

    if (password != confirmPassword) {
      return "Passwords do not match";
    }

    if (!password.contains(RegExp(r'[A-Z]'))) {
      return "Password must contain upper case";
    }

    if (!password.contains(RegExp(r'\W'))) {
      return "Password must contain a symbol";
    }

    if (!password.contains(RegExp(r'[\d]'))) {
      return "Password must contain a number";
    }
    return "";
  }

  static String removeCommaFromString(String amount) {
    String amountString = amount.replaceAll(',', '');
    return amountString;
  }

  static String checkUserInput(String inputName, String value, int minLength) {
    if (value.trim().isEmpty) {
      return '$inputName can not be empty';
    } else if (value.trim().length < minLength) {
      return '$inputName should be a minimum of $minLength characters';
    }
    return "";
  }

//  todo: Input Validators
  static bool isFieldEmpty(String fieldValue) => fieldValue.isEmpty;

  static String? validateName(String value) {
    if (value.trim().isEmpty) return 'Field is required.';
    final RegExp nameExp = RegExp(r'^[A-za-z. ]+$');
    if (!nameExp.hasMatch(value.trim())) {
      return 'Name must be at least two letter words';
    }
    return null;
  }

  static String? validateEmail(String value) {
    if (value.trim().isEmpty) return 'Field is required.';
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value.trim())) {
      return 'Enter a email address';
    } else {
      return null;
    }
  }

  static String? validateNumber(String value) {
    if (value.trim().isEmpty) return 'Field is required.';
    final RegExp nameExp = RegExp(r'^[-0-9 ]+$');
    if (!nameExp.hasMatch(value.trim())) {
      return 'Please enter only numeric characters.';
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String value) {
    if (value.trim().isEmpty) return 'Phone number is required.';
    final RegExp nameExp = RegExp(r'^(?:[+0])?[0-9]{10}$');
    if (!nameExp.hasMatch(value.trim())) {
      return 'Kindly input a valid phone number';
    }
    if (value.trim().length != 11) {
      return 'Kindly input a valid phone number';
    } else {
      return null;
    }
  }

  static String? validateString(dynamic value) {
    if (value.toString().trim().isEmpty) {
      return 'Field is required.';
    } else {
      return null;
    }
  }

   static String? svalidatePassword(dynamic value) {
    if (value.toString().trim().isEmpty) {
      return 'Password is required.';
    } else {
      return null;
    }
  }

  static bool spinnerVaidation(
      BuildContext context, TextEditingController controller, String text) {
    if (controller.text.isEmpty || controller.text == "") {
     // print(controller.text);

      return false;
    } else {
      return true;
    }
  }
}
