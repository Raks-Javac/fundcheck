import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fundcheck/src/core/utils/extensions.dart';
import 'package:fundcheck/src/shared/res/res.dart';
import 'package:fundcheck/src/shared/res/ui_helper.dart';
import 'package:fundcheck/src/shared/widgets/buttons/primary_button.dart';

class SucessBottomSheet extends StatelessWidget {
  final String description;
  final Function onTap;
  final String buttonDescription;
  const SucessBottomSheet(
      {super.key,
      required this.description,
      required this.buttonDescription,
      required this.onTap});

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
            'Congratulations!',
            style: context.theme.textTheme.bodyLarge!.copyWith(
              fontFamily: FStrings.monteserratSemiBold,
              fontSize: 22.sp,
            ),
          ),
          addVertSpace(30),
          Text(
            description,
            textAlign: TextAlign.center,
            style: context.theme.textTheme.bodyLarge!.copyWith(fontSize: 15),
          ),
          const Spacer(),
          FWIdgetsPrimaryButton(
            isEnabled: true,
            buttonTitle: buttonDescription,
            onPressed: () {
              onTap();
            },
            icon: Image.asset(
              'assets/images/arrow-right.png',
            ),
          )
        ],
      ),
    );
  }
}
