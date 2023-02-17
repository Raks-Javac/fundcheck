import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/extensions.dart';
import '../../../../shared/res/ui_helper.dart';
import '../../../../shared/widgets/buttons/primary_button.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.scaffoldBackgroundColor,
      height: screenHeight(context) / 1.5,
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
      child: Column(
        children: [
          addVertSpace(50),
          Image.asset('assets/images/check.png'),
          addVertSpace(70),
          Text(
            'Congratulations',
            style: context.theme.textTheme.bodyLarge!
                .copyWith(fontWeight: FontWeight.bold, fontSize: 22.sp),
          ),
          addVertSpace(30),
          Text(
            'Your account has been set up\n Please proceed to login',
            textAlign: TextAlign.center,
            style: context.theme.textTheme.bodyLarge!.copyWith(fontSize: 15),
          ),
          const Spacer(),
          FWIdgetsPrimaryButton(
            isEnabled: true,
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
