import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fundcheck/src/core/utils/extensions.dart';
import 'package:fundcheck/src/features/dashboard/bottom_nav/nav_provider.dart';
import 'package:fundcheck/src/features/dashboard/budget/view/budget_v.dart';
import 'package:fundcheck/src/features/dashboard/home/view/home_v.dart';
import 'package:fundcheck/src/features/dashboard/more/view/more_v.dart';
import 'package:fundcheck/src/features/dashboard/statistics/view/stat_v.dart';
import 'package:fundcheck/src/features/dashboard/transaction/view/transaction_v.dart';
import 'package:fundcheck/src/shared/res/gap.dart';
import 'package:fundcheck/src/shared/res/res.dart';
import 'package:fundcheck/src/shared/res/ui_helper.dart';

class FCheckNavBar extends ConsumerWidget {
  static final screens = [
    const HomeView(),
    const BudgetView(),
    const TransactionView(),
    const StatisticView(),
    const MoreView()
  ];

  const FCheckNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(navProvider);

    final navNotifier = ref.watch(navProvider.notifier);
    return Scaffold(
      body: Container(child: screens[navNotifier.activeIndex]),
      bottomNavigationBar: SafeArea(
        child: SizedBox(
            height: 70,
            child: Row(
              children: [
                ...BottomNavCustomItem.labelStringList.map((e) {
                  return Expanded(
                    child: InkWell(
                      onTap: () {
                        navNotifier.changeActiveIndexstate(e.index);
                      },
                      child: BottomNavCustomItem(
                          activeIndex: navNotifier.activeIndex,
                          iconPath: e.iconPath,
                          index: e.index,
                          label: e.label),
                    ),
                  );
                })
              ],
            )),
      ),
    );
  }
}

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
