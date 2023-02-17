import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final registerProvider = StateNotifierProvider((ref) {
  return RegisterProvider(false);
});

class RegisterProvider extends StateNotifier<bool> {
  RegisterProvider(super.state);

  bool get enableButtonGetter => state;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  void checkTextField() {
    if (firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        phoneController.text.isNotEmpty) {
      state = true;
    } else {
      state = false;
    }
  }
}
