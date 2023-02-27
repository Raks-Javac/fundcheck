
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fundcheck/src/shared/res/res.dart';
import 'package:fundcheck/src/shared/res/ui_helper.dart';

class ValPassword extends StatelessWidget {
  const ValPassword({
    required this.label,
    required this.color,
    required this.borderColor,
    required this.checkColor,
    Key? key,
    required this.theme,
  }) : super(key: key);

  final String label;
  final Color color;
  final ThemeData theme;
  final Color checkColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedContainer(
          margin: const EdgeInsets.symmetric(vertical: 5),
          height: 20,
          width: 20,
          // padding: const EdgeInsets.all(2),
          duration: const Duration(milliseconds: 500),
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
              color: color,
              borderRadius: BorderRadius.circular(50)),
          child: Icon(
            Icons.check,
            color: checkColor,
            size: 15,
          ),
        ),
        addHorizonSpace(10),
        Text(
          label,
          style: theme.textTheme.bodyMedium!.copyWith(fontSize: 13.sp),
        ),
      ],
    );
  }
}