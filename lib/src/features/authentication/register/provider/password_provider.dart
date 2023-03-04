import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordModel{
  String? firstPass;
  String? seconPass;
  bool? isPasswordLength;
  bool? hasPasswordOneNumber;
  bool? upperCaser;
  bool? specialCharacter;
  bool? equalPassword;
  bool? enableButton;
  bool? firstPassVal;
  bool? secondPassVal;

  PasswordModel({
     this.firstPassVal,
     this.secondPassVal,
     this.isPasswordLength,
     this.hasPasswordOneNumber,
     this.upperCaser,
     this.specialCharacter,
     this.equalPassword,
     this.enableButton,
     this.firstPass,
     this.seconPass,
  });

  // PasswordModel copyWith({
  //   String firstPassCopy,
  //   String seconPassCopy,
  //   bool isPasswordLengthCopy,
  // bool hasPasswordOneNumberCopy,
  // bool upperCaserCopy,
  // bool specialCharacterCopy,
  // bool equalPasswordCopy,
  // bool enableButtonCopy,
  // bool firstPassValCopy,
  // bool secondPassValCopy,
  // }){
  //   return PasswordModel(firstPassVal: firstPassCopy ?? firstPass, secondPassVal: secondPassVal, isPasswordLength: isPasswordLength, hasPasswordOneNumber: hasPasswordOneNumber, upperCaser: upperCaser, specialCharacter: specialCharacter, equalPassword: equalPassword, enableButton: enableButton, firstPass: firstPass, seconPass: seconPass)
  // }
}

 final passwordProvider = StateNotifierProvider((ref){
   return PasswordNotifer(PasswordModel());
 });

class PasswordNotifer extends StateNotifier<PasswordModel> {

  final TextEditingController password1Controller = TextEditingController();
  final TextEditingController password2Controller = TextEditingController();

  PasswordNotifer(super.state);
  buttonEnable(){
    if(state.firstPassVal! && state.secondPassVal!){
      state.enableButton = true;
    }else{
      state.enableButton = false;
    }
  }



  onPasswordChange(PasswordModel password){
    final numRegex = RegExp(r'[0-9]');
    final alphabetRegex = RegExp(r'[A-Z]');
    final specialRegex = RegExp(r'\W');

  
       state.isPasswordLength = false;
      if(password.firstPass!.length >= 6){
        state.isPasswordLength = true;
      }
      state.hasPasswordOneNumber = false;
      if(numRegex.hasMatch(password.firstPass!) && alphabetRegex.hasMatch(password.firstPass!)){
        state.hasPasswordOneNumber = true;
      }
      state.specialCharacter = false;
      if(specialRegex.hasMatch(password.firstPass!)){
        state.specialCharacter = true;
      }
      state.equalPassword = false;
     if(password.firstPass == password.seconPass){
       state.equalPassword = true;
     }
    }
  }


