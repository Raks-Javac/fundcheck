

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordModel {
   String firstPass;
   String seconPass;
  final bool isPasswordLength;
  final bool hasPasswordOneNumber;
  final bool upperCaser;
  final bool specialCharacter;
  final bool equalPassword;
  final bool enableButton;
  final bool togglePassword1;
  final bool togglePassword2;
  final bool isValid;

   PasswordModel({
    this.firstPass = '',
    this.seconPass = '',
    this.isPasswordLength = false,
    this.hasPasswordOneNumber = false,
    this.upperCaser = false,
    this.specialCharacter = false,
    this.equalPassword = false,
    this.enableButton = false,
    this.togglePassword1 = false,
    this.togglePassword2 = false,
    this.isValid = false,
  });
  PasswordModel copyWith({
    String? firstPass,
    String? seconPass,
    bool? isPasswordLength,
    bool? hasPasswordOneNumber,
    bool? upperCaser,
    bool? specialCharacter,
    bool? equalPassword,
    bool? enableButton,
    bool? togglePassword1,
    bool? togglePassword2,
    bool? isValid,
  }) {
    return PasswordModel(
      firstPass: firstPass ?? this.firstPass,
      seconPass: seconPass ?? this.seconPass,
      isPasswordLength: isPasswordLength ?? this.isPasswordLength,
      hasPasswordOneNumber: hasPasswordOneNumber ?? this.hasPasswordOneNumber,
      upperCaser: upperCaser ?? this.upperCaser,
      specialCharacter: specialCharacter ?? this.specialCharacter,
      equalPassword: equalPassword ?? this.equalPassword,
      enableButton: enableButton ?? this.enableButton,
      togglePassword1: togglePassword1 ?? this.togglePassword1,
      togglePassword2: togglePassword2 ?? this.togglePassword2,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  bool operator ==(covariant PasswordModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.firstPass == firstPass &&
      other.seconPass == seconPass &&
      other.isPasswordLength == isPasswordLength &&
      other.hasPasswordOneNumber == hasPasswordOneNumber &&
      other.upperCaser == upperCaser &&
      other.specialCharacter == specialCharacter &&
      other.equalPassword == equalPassword &&
      other.enableButton == enableButton &&
      other.togglePassword1 == togglePassword1 &&
      other.togglePassword2 == togglePassword2 &&
      other.isValid == isValid;
  }

  @override
  int get hashCode {
    return firstPass.hashCode ^
      seconPass.hashCode ^
      isPasswordLength.hashCode ^
      hasPasswordOneNumber.hashCode ^
      upperCaser.hashCode ^
      specialCharacter.hashCode ^
      equalPassword.hashCode ^
      enableButton.hashCode ^
      togglePassword1.hashCode ^
      togglePassword2.hashCode ^
      isValid.hashCode;
  }

  @override
  String toString() {
    return 'PasswordModel(firstPass: $firstPass, seconPass: $seconPass, isPasswordLength: $isPasswordLength, hasPasswordOneNumber: $hasPasswordOneNumber, upperCaser: $upperCaser, specialCharacter: $specialCharacter, equalPassword: $equalPassword, enableButton: $enableButton, togglePassword1: $togglePassword1, togglePassword2: $togglePassword2, isValid: $isValid)';
  }
}

final passwordProvider = StateNotifierProvider<PasswordRepositry, PasswordModel>((ref) {
  return PasswordRepositry();
});


class PasswordRepositry extends StateNotifier<PasswordModel> {
  PasswordRepositry() : super( PasswordModel());

  final TextEditingController password1Controller = TextEditingController();
  final TextEditingController password2Controller = TextEditingController();


  

   toggleFirstPassword() {
    state = state.copyWith(togglePassword1: !state.togglePassword1);
   }

   toggleSecondPassword() {
    state = state.copyWith(togglePassword2: !state.togglePassword2);
   }




    onPasswordChange(String? val){
    final numRegex = RegExp(r'[0-9]');
    final alphabetRegex = RegExp(r'[A-Z]');
    final specialRegex = RegExp(r'\W');


      if(state.firstPass.length >= 6 ){
        state = state.copyWith(isPasswordLength: true);
      }else{
         state = state.copyWith(isPasswordLength: false);
      }
      
      if(numRegex.hasMatch(state.firstPass) && alphabetRegex.hasMatch(state.firstPass)){
        state = state.copyWith(hasPasswordOneNumber: true);
      } else{
        state = state.copyWith(hasPasswordOneNumber: false);
      }
      
      if(specialRegex.hasMatch(state.firstPass)){
      state = state.copyWith(specialCharacter: true);
      }else{
        state = state.copyWith(specialCharacter: false);
      }
     
     if(state.firstPass == state.seconPass){
    state = state.copyWith(equalPassword: true);
     }else{
       state = state.copyWith(equalPassword: false);
     }
    }


}

