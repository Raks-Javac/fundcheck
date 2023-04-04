import 'package:flutter/material.dart';
import 'package:fundcheck/src/features/dashboard/bottom_nav/provider/nav_provider.dart';
import 'package:fundcheck/src/features/dashboard/bottom_nav/widgets/bottom_nav_item.dart';
import 'package:fundcheck/src/features/dashboard/budget/view/budget_v.dart';
import 'package:fundcheck/src/features/dashboard/home/view/home_v.dart';
import 'package:fundcheck/src/features/dashboard/more/view/more_v.dart';
import 'package:fundcheck/src/features/dashboard/statistics/view/stat_v.dart';
import 'package:fundcheck/src/features/dashboard/transaction/view/transaction_v.dart';
import 'package:provider/provider.dart';

class FCheckNavBar extends StatelessWidget {
  static final List<Widget> screens = [
    const HomeView(),
    const BudgetView(),
    const TransactionView(),
    const StatisticView(),
    const MoreView()
  ];

  const FCheckNavBar({super.key});
  // ref.watch(navProvider);

  //   final navNotifier = ref.watch(navProvider.notifier);
  @override
  Widget build(BuildContext context) {
    return Consumer<NavProvider>(builder: (context, navNotifier, _) {
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
    });
  }
}
