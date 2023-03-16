import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fundcheck/src/core/utils/extensions.dart';
import 'package:fundcheck/src/shared/res/gap.dart';
import 'package:fundcheck/src/shared/res/res.dart';
import 'package:fundcheck/src/shared/res/ui_helper.dart';

class BottomNavCustomItem extends StatelessWidget {
  final int index;
  final int activeIndex;
  final String iconPath;
  final String label;
  const BottomNavCustomItem({
    super.key,
    required this.activeIndex,
    required this.iconPath,
    required this.index,
    required this.label,
  });

  static List<BottomItemObject> labelStringList = [
    BottomItemObject(FIcons.homeIcon, "Home", 0),
    BottomItemObject(FIcons.budgetIcon, "Budget", 1),
    BottomItemObject(FIcons.transactionIcon, "Transactions", 2),
    BottomItemObject(FIcons.statIcon, "Stats", 3),
    BottomItemObject(FIcons.moreIcon, "More", 4),
  ];

  @override
  Widget build(BuildContext context) {
    // log(activeIndex.toString());
    return Column(
      children: [
        Divider(
          thickness: 3,
          height: 3,
          color:
              activeIndex == index ? FColors.primaryBlue : Colors.transparent,
        ),
        addVertSpace(12),
        ImageIcon(
          AssetImage(iconPath),
          color:
              activeIndex == index ? FColors.primaryBlue : FColors.primaryGrey,
          size: 24,
        ),
        addVerticalSpacing(5),
        AutoSizeText(
          label,
          maxLines: 1,
          minFontSize: 8,
          maxFontSize: 11,
          style: context.theme.textTheme.labelLarge?.copyWith(
            fontSize: 9.5.sp,
            color: activeIndex == index
                ? FColors.primaryBlue
                : FColors.primaryGrey,
          ),
        ),
      ],
    );
  }
}

class BottomItemObject {
  String label;
  String iconPath;
  int index;
  BottomItemObject(this.iconPath, this.label, this.index);
}
