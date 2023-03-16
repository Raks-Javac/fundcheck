import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fundcheck/src/core/utils/extensions.dart';
import 'package:fundcheck/src/shared/res/res.dart';

class TrasactionDateTile extends StatelessWidget {
  final int activeIndex;
  final int tileIndex;
  final String label;
  const TrasactionDateTile({
    super.key,
    required this.activeIndex,
    required this.label,
    required this.tileIndex,
  });
  static final List<TransactionDateObject> transactionDateCategoryList = [
    TransactionDateObject("Today", 0),
    TransactionDateObject("This week", 1),
    TransactionDateObject("This month", 2),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: activeIndex != tileIndex
          ? const BoxDecoration(
              color: FColors.tertiaryGrey2,
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            )
          : BoxDecoration(
              color: FColors.tertiaryBlue5,
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
              border: Border.all(
                color: FColors.primaryBlue,
              )),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25.0,
          vertical: 9,
        ),
        child: Text(
          label,
          style: context.theme.textTheme.headlineMedium?.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: activeIndex != tileIndex
                ? FColors.tertiaryGrey
                : FColors.primaryBlue,
            fontFamily: FStrings.monteserratSemiBold,
          ),
        ),
      ),
    );
  }
}

class TransactionDateObject {
  final String label;
  final int index;
  TransactionDateObject(this.label, this.index);
}
