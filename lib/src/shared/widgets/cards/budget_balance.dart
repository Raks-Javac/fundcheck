import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fundcheck/src/core/utils/extensions.dart';
import 'package:fundcheck/src/shared/res/gap.dart';
import 'package:fundcheck/src/shared/res/res.dart';

class CardBudgetBalanceCard extends StatelessWidget {
  const CardBudgetBalanceCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(4),
          bottomRight: Radius.circular(4),
        ),
        image: DecorationImage(
          image: AssetImage(FIcons.amountCardBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            AutoSizeText(
              "₦0.00",
              minFontSize: 12,
              maxLines: 1,
              maxFontSize: 28,
              stepGranularity: 4,
              style: context.theme.textTheme.headlineMedium?.copyWith(
                fontSize: 35.sp,
                fontWeight: FontWeight.bold,
                fontFamily: FStrings.monteserratSemiBold,
                color: FColors.primaryBlue,
              ),
            ),
            addVerticalSpacing(5),
            Text(
              "3rd March to 3rd June",
              style: context.theme.textTheme.headlineMedium?.copyWith(
                  fontSize: 12.sp,
                  fontFamily: FStrings.monteserratSemiBold,
                  color: FColors.black),
            )
          ],
        ),
      )),
    );
  }
}
