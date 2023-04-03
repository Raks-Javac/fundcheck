import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fundcheck/src/core/utils/extensions.dart';
import 'package:fundcheck/src/features/dashboard/budget/view/budget_v.dart';
import 'package:fundcheck/src/features/dashboard/home/view/home_v.dart';
import 'package:fundcheck/src/features/dashboard/more/view/more_v.dart';
import 'package:fundcheck/src/features/dashboard/statistics/view/stat_v.dart';
import 'package:fundcheck/src/features/dashboard/transaction/view/transaction_v.dart';
import 'package:fundcheck/src/shared/res/res.dart';
import 'package:fundcheck/src/shared/res/ui_helper.dart';



class FCheckNavBar extends StatefulWidget {
  const FCheckNavBar({super.key});

  @override
  State<FCheckNavBar> createState() => _FCheckNavBarState();
}

class _FCheckNavBarState extends State<FCheckNavBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this)..addListener(() {});
    super.initState();
  }

  final screens = [
   const HomeView(),
   const BudgetView(),
   const TransactionView(),
   const StatisticView(),
   const MoreView()
  ];
  int activeIndex = 0;

  changeActiveIndexstate(int index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[activeIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: context.theme.scaffoldBackgroundColor,
          onTap: changeActiveIndexstate,
          currentIndex: activeIndex,
          unselectedItemColor: FColors.primaryGrey,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: FColors.primaryBlue,
          items: [
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
                  child: Column(
                    children: [
                      Divider(
                        thickness: 3,
                        height: 3,
                        color: activeIndex == 0
                            ? FColors.primaryBlue
                            : Colors.transparent,
                      ),
                      addVertSpace(12),
                      Image.asset(
                        FIcons.homeIcon,
                        color: activeIndex == 0
                            ? FColors.primaryBlue
                            : FColors.primaryGrey,
                        height: 15.w,
                      ),
                    ],
                  ),
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
                  child: Column(
                    children: [
                      Divider(
                        thickness: 3,
                        height: 3,
                        color: activeIndex == 1
                            ? FColors.primaryBlue
                            : Colors.transparent,
                      ),
                      addVertSpace(12),
                      Image.asset(
                        FIcons.budgetIcon,
                        color: activeIndex == 1
                            ? FColors.primaryBlue
                            : FColors.primaryGrey,
                        height: 15.w,
                      ),
                    ],
                  ),
                ),
                label: 'Budget'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
                  child: Column(
                    children: [
                      Divider(
                        thickness: 3,
                        height: 3,
                        color: activeIndex == 2
                            ? FColors.primaryBlue
                            : Colors.transparent,
                      ),
                      addVertSpace(12),
                      Image.asset(
                        FIcons.transactionIcon,
                        color: activeIndex == 2
                            ? FColors.primaryBlue
                            : FColors.primaryGrey,
                        height: 15.w,
                      ),
                    ],
                  ),
                ),
                label: 'Transactions'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
                  child: Column(
                    children: [
                      Divider(
                        thickness: 3,
                        height: 3,
                        color: activeIndex == 3
                            ? FColors.primaryBlue
                            : Colors.transparent,
                      ),
                      addVertSpace(12),
                      Image.asset(
                        FIcons.statIcon,
                        color: activeIndex == 3
                            ? FColors.primaryBlue
                            : FColors.primaryGrey,
                        height: 15.w,
                      ),
                    ],
                  ),
                ),
                label: 'Stats'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
                  child: Column(
                    children: [
                      Divider(
                        thickness: 3,
                        height: 3,
                        color: activeIndex == 4
                            ? FColors.primaryBlue
                            : Colors.transparent,
                      ),
                      addVertSpace(12),
                      Image.asset(
                        FIcons.moreIcon,
                        color: activeIndex == 4
                            ? FColors.primaryBlue
                            : FColors.primaryGrey,
                        height: 15.w,
                      ),
                    ],
                  ),
                ),
                label: 'More'),
          ]),
    );
  }
}
