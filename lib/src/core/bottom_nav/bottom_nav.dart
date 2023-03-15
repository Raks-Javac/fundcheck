import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fundcheck/src/core/utils/extensions.dart';
import 'package:fundcheck/src/features/budget/view/budget_v.dart';
import 'package:fundcheck/src/features/home/view/home_v.dart';
import 'package:fundcheck/src/features/more/view/more_v.dart';
import 'package:fundcheck/src/features/statistics/view/stat_v.dart';
import 'package:fundcheck/src/features/transaction/view/transaction_v.dart';
import 'package:fundcheck/src/shared/res/res.dart';
import 'package:fundcheck/src/shared/res/ui_helper.dart';

// class FCheckNavBar extends StatefulWidget {
//   @override
//   State<FCheckNavBar> createState() => _FCheckNavBarState();
// }

// class _FCheckNavBarState extends State<FCheckNavBar>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   @override
//   void initState() {
//     _tabController = TabController(length: 5, vsync: this)..addListener(() {});
//     super.initState();
//   }

//   int activeIndex = 0;
//   changeActiveIndexstate(int index) {
//     setState(() {
//       activeIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Stack(
//       children: [
//         TabBarView(
//             physics: const NeverScrollableScrollPhysics(),
//             controller: _tabController,
//             children: const [
//               HomeView(),
//               BudgetView(),
//               TransactionView(),
//               StatisticView(),
//               MoreView()
//             ]),
//         Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Container(
//               decoration: const BoxDecoration(
//                 // boxShadow: [
//                 //   BoxShadow(
//                 //     offset: const Offset(-1, 1),
//                 //     blurRadius: 20,
//                 //     spreadRadius: 0,
//                 //     color: Colors.grey.withOpacity(0.1),
//                 //   )
//                 // ],
//                 color: Colors.white,
//               ),
//              padding: const EdgeInsets.only(left: 10, right: 10),
//            //  height: 75,
//               child: TabBar(
//                   isScrollable: false,
//                   onTap: (value) {
//                     changeActiveIndexstate(value);
//                   },
//                   unselectedLabelColor: Theme.of(context).primaryColor,
//                   splashFactory: NoSplash.splashFactory,
//                   indicatorWeight: 0.02,
//                   controller: _tabController,
//                   tabs: [

//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                          Divider(
//                           thickness: 3,
//                           height: 3,
//                            color: _tabController.index == 0 ? FColors.primaryBlue : Colors.transparent,
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//                           width: _tabController.index == 0 ? 50 : 55,
//                           height: _tabController.index == 0 ? 40 : 45,
//                           child: Padding(
//                               padding: const EdgeInsets.all(8.5),
//                               child: Image.asset(
//                                 FIcons.homeIcon,
//                                 color: _tabController.index == 0
//                                     ? FColors.primaryBlue
//                                     : FColors.primaryGrey,
//                               )),
//                         ),
//                         Text(
//                           "Home",
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodyMedium!
//                               .copyWith(
//                                   color: _tabController.index == 0
//                                       ? FColors.primaryBlue
//                                       : FColors.primaryGrey,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 11.sp),
//                         ),
//                          addVertSpace(20)
//                       ],
//                     ),

//                      Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                          Divider(
//                           thickness: 3,
//                           height: 3,
//                            color: _tabController.index == 1 ? FColors.primaryBlue : Colors.transparent,
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//                           width: _tabController.index == 1 ? 50 : 55,
//                           height: _tabController.index == 1 ? 40 : 45,
//                           child: Padding(
//                               padding: const EdgeInsets.all(8.5),
//                               child: Image.asset(
//                                 FIcons.budgetIcon,
//                                 color: _tabController.index == 1
//                                     ? FColors.primaryBlue
//                                     : FColors.primaryGrey,
//                               )),
//                         ),
//                         Text(
//                           "Budget",
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodyMedium!
//                               .copyWith(
//                                   color: _tabController.index == 1
//                                       ? FColors.primaryBlue
//                                       : FColors.primaryGrey,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 11.sp),
//                         ),
//                       ],
//                     ),

//                    Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                          Divider(
//                           thickness: 3,
//                           height: 3,
//                            color: _tabController.index == 2 ? FColors.primaryBlue : Colors.transparent,
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//                           width: _tabController.index == 2 ? 50 : 55,
//                           height: _tabController.index == 2 ? 40 : 45,
//                           child: Padding(
//                               padding: const EdgeInsets.all(8.5),
//                               child: Image.asset(
//                                 FIcons.transactionIcon,
//                                 color: _tabController.index == 2
//                                     ? FColors.primaryBlue
//                                     : FColors.primaryGrey,
//                               )),
//                         ),
//                         Text(
//                           "Transactions",
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodyMedium!
//                               .copyWith(
//                                   color: _tabController.index == 2
//                                       ? FColors.primaryBlue
//                                       : FColors.primaryGrey,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 11.sp),
//                         )
//                       ],
//                     ),

//                      Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                          Divider(
//                           thickness: 3,
//                           height: 3,
//                            color: _tabController.index == 3 ? FColors.primaryBlue : Colors.transparent,
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//                           width: _tabController.index == 3 ? 50 : 55,
//                           height: _tabController.index == 3 ? 40 : 45,
//                           child: Padding(
//                               padding: const EdgeInsets.all(8.5),
//                               child: Image.asset(
//                                 FIcons.statIcon,
//                                 color: _tabController.index == 3
//                                     ? FColors.primaryBlue
//                                     : FColors.primaryGrey,
//                               )),
//                         ),
//                         Text(
//                           "Stats",
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodyMedium!
//                               .copyWith(
//                                   color: _tabController.index == 3
//                                       ? FColors.primaryBlue
//                                       : FColors.primaryGrey,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 11.sp),
//                         )
//                       ],
//                     ),

//                      Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                          Divider(
//                           thickness: 3,
//                           height: 3,
//                            color: _tabController.index == 4 ? FColors.primaryBlue : Colors.transparent,
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//                           width: _tabController.index == 4 ? 50 : 55,
//                           height: _tabController.index == 4 ? 40 : 45,
//                           child: Padding(
//                               padding: const EdgeInsets.all(8.5),
//                               child: Image.asset(
//                                 FIcons.moreIcon,
//                                 color: _tabController.index == 4
//                                     ? FColors.primaryBlue
//                                     : FColors.primaryGrey,
//                               )),
//                         ),
//                         Text(
//                           "More",
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodyMedium!
//                               .copyWith(
//                                   color: _tabController.index == 4
//                                       ? FColors.primaryBlue
//                                       : FColors.primaryGrey,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 11.sp),
//                         )
//                       ],
//                     ),

//                   ]),
//             ),
//           ],
//         )
//       ],
//     ));

//     // bottomNavigationBar:
//   }
// }

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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
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
