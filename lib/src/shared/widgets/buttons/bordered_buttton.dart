import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/extensions.dart';

class FWidgetsBorderedButton extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onPressed;
  final Widget? icon;
  const FWidgetsBorderedButton(
      {super.key,
      required this.buttonTitle,
      required this.onPressed,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(width: 1.0, color: context.theme.primaryColor)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 13.0),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  buttonTitle,
                  style: context.theme.textTheme.bodyMedium!.copyWith(
                    color: context.theme.primaryColor,
                    fontSize: 14.5.sp,
                  ),
                ),
                if (icon != null) icon!
              ],
            ),
          ),
        ),
      ),
    );
  }
}
