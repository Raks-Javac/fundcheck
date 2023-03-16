import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fundcheck/src/core/utils/extensions.dart';
import 'package:fundcheck/src/shared/res/res.dart';
import 'package:fundcheck/src/shared/res/ui_helper.dart';

class BudgetInsightItem extends StatelessWidget {
  const BudgetInsightItem({
    super.key,
    required this.label,
    required this.inNaira,
    required this.percentage,
    required this.percentageColor,
  });
  final String label;
  final String percentage;
  final String inNaira;
  final Color percentageColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.theme.textTheme.headlineMedium?.copyWith(
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
            color: FColors.primaryGrey,
          ),
        ),
        addVertSpace(6),
        AutoSizeText(
          "$percentage %",
          minFontSize: 12,
          maxLines: 1,
          maxFontSize: 36,
          stepGranularity: 4,
          style: context.theme.textTheme.headlineMedium?.copyWith(
            fontSize: 35.sp,
            fontWeight: FontWeight.w700,
            fontFamily: FStrings.monteserratSemiBold,
            color: percentageColor,
          ),
        ),
        addVertSpace(4),
        Text(
          "₦$inNaira",
          style: context.theme.textTheme.headlineMedium?.copyWith(
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            color: FColors.primaryGrey,
          ),
        )
      ],
    );
  }
}
