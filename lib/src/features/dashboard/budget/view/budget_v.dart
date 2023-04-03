import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fundcheck/src/core/navigation/navigation_helpers.dart';
import 'package:fundcheck/src/core/utils/extensions.dart';
import 'package:fundcheck/src/features/dashboard/budget/view/create_budget_v.dart';
import 'package:fundcheck/src/features/dashboard/budget/widget/add_widget.dart';
import 'package:fundcheck/src/shared/res/res.dart';

class BudgetView extends StatelessWidget {
  const BudgetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: SafeArea(
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Budget',
                        style: context.theme.textTheme.headlineMedium?.copyWith(
                          fontSize: 17.sp,
                          fontFamily: FStrings.monteserratSemiBold,
                        ),
                      ),
                      const CircleAvatar(
                        backgroundImage: AssetImage(FIcons.profileImage),
                      )
                    ],
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(FIcons.messageImg),
                        Text(
                          'You don\'t' ' have a budget set',
                          style:
                              context.theme.textTheme.headlineMedium?.copyWith(
                            fontSize: 15.sp,
                            fontFamily: FStrings.monteserratSemiBold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Click on',
                              style: context.theme.textTheme.headlineMedium
                                  ?.copyWith(
                                fontSize: 12.sp,
                                color: FColors.primaryGrey,
                                fontFamily: FStrings.monteserratRegular,
                              ),
                            ),
                            AddIcon(),
                            Text(
                              'to create a budget',
                              style: context.theme.textTheme.headlineMedium
                                  ?.copyWith(
                                fontSize: 12.sp,
                                color: FColors.primaryGrey,
                                fontFamily: FStrings.monteserratRegular,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ))),
      floatingActionButton: AddIcon(
        onTap: ()=>FNavigator.navigateToRoute(CreateBudget()),
        height: 55,
        width: 55,
        borderWidth: 2.w,
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Image.asset(FIcons.addIcon),
      //   elevation: 0,
      //   backgroundColor: FColors.primaryYellow,

      // ),
    );
  }
}


