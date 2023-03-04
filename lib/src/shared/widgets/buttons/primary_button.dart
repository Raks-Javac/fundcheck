import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/extensions.dart';
import '../../res/res.dart';

class FWIdgetsPrimaryButton extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onPressed;
  final Widget? icon;
  final bool isEnabled;
  const FWIdgetsPrimaryButton(
      {super.key,
      required this.isEnabled,
      required this.buttonTitle,
      required this.onPressed,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isEnabled ? 1 : 0.5,
      child: MaterialButton(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        onPressed: onPressed,
        color: isEnabled ? context.theme.primaryColor : FColors.tertiaryGrey2,
        minWidth: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                buttonTitle,
                style: context.theme.textTheme.bodyMedium!.copyWith(
                  color: isEnabled ? FColors.white : FColors.black,
                  fontSize: 14.5.sp,
                ),
              ),
              if (icon != null) icon!
            ],
          ),
        ),
      ),
    );
  }
}
