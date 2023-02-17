import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/navigation/navigation_helpers.dart';
import '../../../../shared/res/ui_helper.dart';
import '../../../../shared/widgets/buttons/primary_button.dart';

class SuccessView extends StatelessWidget {
  SuccessView({super.key});

  final TextEditingController _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: screenHeight(context) / 1.5,
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
      child: Column(
        children: [
          FNavigator.dividerModelSheet(),
          addVertSpace(50),
          Image.asset('assets/images/check.png'),
          addVertSpace(70),
          Text(
            'Congratulations',
            style: theme.textTheme.bodyLarge!
                .copyWith(fontWeight: FontWeight.bold, fontSize: 22.sp),
          ),
          addVertSpace(30),
          Text(
            'Your account has been set up\n Please proceed to login',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge!.copyWith(fontSize: 15),
          ),
          const Spacer(),
          FWIdgetsPrimaryButton(
            buttonTitle: 'Log in',
            onPressed: () {},
            icon: Image.asset(
              'assets/images/arrow-right.png',
            ),
          )
        ],
      ),
    );
  }
}
