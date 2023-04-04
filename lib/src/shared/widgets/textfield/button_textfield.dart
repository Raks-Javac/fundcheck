import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/extensions.dart';
import '../../res/res.dart';
import '../../res/ui_helper.dart';

class FButtonTField extends StatelessWidget {
  final String? label;
  final Function()? onTap;
  final String hintText;
  final bool useOpacityForValidation;
  final bool isFieldValidated;
  const FButtonTField({
    Key? key,
    required this.label,
    required this.useOpacityForValidation,
    this.isFieldValidated = false,
    this.onTap,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label!,
          style: theme.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w900,
              fontFamily: FStrings.monteserratRegular,
              fontSize: screenAwareSize(19.sp, context)),
        ),
        addVertSpace(8.5.h),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: isFieldValidated == true
                      ? theme.textTheme.bodyLarge!.color!
                      : FColors.primaryGrey.withOpacity(0.4),
                )),
            child: SizedBox(
              child: Material(
                color: context.theme.scaffoldBackgroundColor,
                elevation: 0,
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        hintText,
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: isFieldValidated == true
                              ? theme.textTheme.bodyLarge!.color!
                              : FColors.primaryGrey.withOpacity(0.4),
                        ),
                      ),
                      Image.asset(
                        FIcons.circleArrow,
                        color: isFieldValidated == true
                            ? theme.textTheme.bodyLarge!.color!
                            : FColors.primaryGrey.withOpacity(0.4),
                      ),
                    ]),
              ),
            ),
          ),
        )
      ],
    );
  }
}
