import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../res/res.dart';

class FWIdgetsPrimaryButton extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onPressed;
  final Widget? icon;
  const FWIdgetsPrimaryButton(
      {super.key,
      required this.buttonTitle,
      required this.onPressed,
      this.icon});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      onPressed: onPressed,
      color: theme.primaryColor,
      minWidth: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              buttonTitle,
              style: theme.textTheme.bodyMedium!.copyWith(
                color: FColors.white,
                fontSize: 18.sp
              ),
            ),
            if (icon != null) icon!
          ],
        ),
      ),
    );
  }
}




