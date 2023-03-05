import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordModel{
  String firstPass;
  String seconPass;
  bool isPasswordLength;
  bool hasPasswordOneNumber;
  bool upperCaser;
  bool specialCharacter;
  bool equalPassword;
  bool enableButton;
  bool firstPassVal;
  bool secondPassVal;

  PasswordModel({
    required this.firstPassVal,
    required this.secondPassVal,
    required this.isPasswordLength,
    required this.hasPasswordOneNumber,
    required this.upperCaser,
    required this.specialCharacter,
    required this.equalPassword,
    required this.enableButton,
    required this.firstPass,
    required this.seconPass,
  });
}

class PasswordNotifer extends StateNotifier<PasswordModel> {
  PasswordNotifer(super.state);

  buttonEnable(){
    if( state.firstPassVal && state.secondPassVal){
      state.enableButton = true;
    }else{
      state.enableButton = false;
    }
  }


  //  bool _obscure1 = true;
  // bool _obscure2 = true;
  // bool _opacityEnabled = false;

  // void toggle1() {
  //   setState(() {
  //     _obscure1 = !_obscure1;
  //   });
  // }

  // void toggle2() {
  //     _obscure2 = !_obscure2;
  // }

  // void checkOpacity() {
 
  //     if (state.firstPassValq.text.isNotEmpty &&
  //         _passwordController2.text.isNotEmpty) {
  //       _opacityEnabled = true;
  //     } else {
  //       _opacityEnabled = false;
  //     }
    
  // }

  // bool isPasswordLength = false;
  //  bool hasPasswordOneNumber = false;
  //  bool specialCharacter = false;
  //  bool equalPassword = false;
  //  bool passwordCheck = false;

  // String password = '';
  // String confirmPassword = '';

  onPasswordChange(PasswordModel password){
    final numRegex = RegExp(r'[0-9]');
    final alphabetRegex = RegExp(r'[A-Z]');
    final specialRegex = RegExp(r'\W');

  
       state.isPasswordLength = false;
      if(password.firstPass.length >= 6){
        state.isPasswordLength = true;
      }
      state.hasPasswordOneNumber = false;
      if(numRegex.hasMatch(password.firstPass) && alphabetRegex.hasMatch(password.firstPass)){
        state.hasPasswordOneNumber = true;
      }
      state.specialCharacter = false;
      if(specialRegex.hasMatch(password.firstPass)){
        state.specialCharacter = true;
      }
      state.equalPassword = false;
     if(password.firstPass == password.seconPass){
       state.equalPassword = true;
     }
    }
  }


