import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fundcheck/src/shared/res/res.dart';

class AddIcon extends StatelessWidget {
  final double? height;
  final double? width;
  final double? borderWidth;
  final Function()? onTap;
  const AddIcon({
    super.key,
    this.height,
    this.width,
    this.onTap,
    this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        height: height ?? 23,
        width: width ?? 23,
        decoration: BoxDecoration(
          border:
              Border.all(color: FColors.primaryBlue, width: borderWidth ?? 1.w),
          borderRadius: BorderRadius.circular(50),
          color: FColors.primaryYellow,
        ),
        child: Image.asset(FIcons.addIcon),
      ),
    );
  }
}