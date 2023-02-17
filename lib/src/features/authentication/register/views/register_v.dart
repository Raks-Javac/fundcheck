import 'package:flutter/material.dart';

import '../../../../core/navigation/navigation_helpers.dart';
import '../../../../core/utils/validators/f_validators.dart';
import '../../../../shared/res/res.dart';
import '../../../../shared/res/ui_helper.dart';
import '../../../../shared/widgets/buttons/primary_button.dart';
import '../../../../shared/widgets/textfield/auth_textfield.dart';
import 'verify_email.dart';

class OpenAccount extends StatefulWidget {
  const OpenAccount({super.key});

  @override
  State<OpenAccount> createState() => _OpenAccountState();
}

class _OpenAccountState extends State<OpenAccount> {
  String image = 'assets/images/arrow-left.png';

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool _isButtonEnabled = false;

  final _formKey = GlobalKey<FormState>();

  void _checkTextField() {
    setState(() {
      if (_firstNameController.text.isNotEmpty &&
          _lastNameController.text.isNotEmpty &&
          _emailController.text.isNotEmpty &&
          _phoneController.text.isNotEmpty) {
        _isButtonEnabled = true;
      } else {
        _isButtonEnabled = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Open an account',
          style: textTheme.textTheme.bodyLarge!.copyWith(
            color: FColors.black,
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () => FNavigator.popSheet(), child: Image.asset(image)),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 70),
        child: Column(
          children: [
            Opacity(
              opacity: _isButtonEnabled ? 1 : 0.5,
              child: FAuthTField(
                label: 'First name',
                hintText: 'Enter your first name',
                textEditingController: _firstNameController,
                validator: (value) => FCheckValidator.validateName(value!),
                onChanged: (_) {
                  _checkTextField();
                },
              ),
            ),
            addVertSpace(20),
            Opacity(
              opacity: _isButtonEnabled ? 1 : 0.5,
              child: FAuthTField(
                label: 'Last name',
                hintText: 'Enter your first name',
                textEditingController: _lastNameController,
                onChanged: (_) {
                  _checkTextField();
                },
                validator: (value) => FCheckValidator.validateName(value!),
              ),
            ),
            addVertSpace(20),
            Opacity(
              opacity: _isButtonEnabled ? 1 : 0.5,
              child: FAuthTField(
                label: 'Email address',
                hintText: 'fundcheck@gmail.com',
                textEditingController: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) => FCheckValidator.validateEmail(value!),
                onChanged: (_) {
                  _checkTextField();
                },
              ),
            ),
            addVertSpace(20),
            Opacity(
              opacity: _isButtonEnabled ? 1 : 0.5,
              child: FAuthTField(
                label: 'Phone number',
                hintText: 'Enter your phone number',
                textEditingController: _phoneController,
                keyboardType: TextInputType.number,
                validator: (val) => FCheckValidator.validatePhoneNumber(val!),
                onChanged: (_) {
                  _checkTextField();
                },
              ),
            ),
            const Spacer(),
            Opacity(
              opacity: _isButtonEnabled ? 1 : 0.5,
              child: FWIdgetsPrimaryButton(
                buttonTitle: 'Continue',
                onPressed: () {
                  // _formKey.currentState!.validate();
                  _isButtonEnabled
                      ? FNavigator.displayBottomSheet(context, VerifyEmail())
                      : () {};
                  print(_formKey);
                },
                icon: Image.asset(
                  'assets/images/arrow-right.png',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
