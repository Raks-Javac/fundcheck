

//    

// class AuthProvider extends StateNotifier<dynamic>{
//   String password = '';
//    String confirmPassword = '';
//    bool isPasswordLength = false;
//    bool hasPasswordOneNumber = false;
//    bool specialCharacter = false;
//    bool equalPassword = false;
//    bool passwordCheck = false;

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
//       passwordCheck = false;
//      if(confirmPassword == password){
//        passwordCheck = true;
//      }
//     });
//   }
// }