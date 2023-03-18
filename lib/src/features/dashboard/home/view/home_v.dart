import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fundcheck/src/app_level_locator/provider_locator.dart';
import 'package:fundcheck/src/core/utils/extensions.dart';
import 'package:fundcheck/src/features/dashboard/home/provider/home_provider.dart';
import 'package:fundcheck/src/features/dashboard/home/widgets/insight_widget.dart';
import 'package:fundcheck/src/features/dashboard/home/widgets/transaction_date_tile.dart';
import 'package:fundcheck/src/shared/res/gap.dart';
import 'package:fundcheck/src/shared/res/res.dart';
import 'package:fundcheck/src/shared/res/theme/provider/theme/theme_provider.dart';
import 'package:fundcheck/src/shared/res/ui_helper.dart';
import 'package:fundcheck/src/shared/widgets/cards/budget_balance.dart';
import 'package:fundcheck/src/shared/widgets/render_svg.dart/render_icon.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(homeProvider);
    ref.watch(themeProvider);

    final themProviderNotifier = ref.watch(themeProvider.notifier);
    // final homeStateNotifier = ref.watch(homeProvider.notifier);
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 70,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            "Hello",
                            style: context.theme.textTheme.headlineMedium
                                ?.copyWith(
                              fontSize: 17.sp,
                              fontFamily: FStrings.monteserratSemiBold,
                            ),
                          ),
                          addHorizonSpace(8),
                          Image.asset(
                            FIcons.winkEmoji,
                            width: 24,
                            height: 24,
                          )
                        ],
                      ),
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: FColors.primaryYellow,
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor:
                              themProviderNotifier.mode == AppThemeMode.dark
                                  ? FColors.darkModeBackgroundColor
                                  : FColors.tertiaryYellow,
                          child: Text(
                            "SO",
                            style: context.theme.textTheme.headlineMedium
                                ?.copyWith(
                              fontSize: 15.sp,
                              color: FColors.primaryYellow,
                              fontFamily: FStrings.monteserratSemiBold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //card balance section
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: FColors.primaryBlue,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4),
                              topRight: Radius.circular(4),
                            )),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Current Budget",
                            style: context.theme.textTheme.headlineMedium
                                ?.copyWith(
                              fontSize: 13.sp,
                              color: FColors.neutralWhite,
                              fontWeight: FontWeight.w600,
                              fontFamily: FStrings.monteserratSemiBold,
                            ),
                          ),
                        )),
                      ),
                      const CardBudgetBalanceCard(),
                      addVerticalSpacing(30),
//budget insight section
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Budget insight",
                            style: context.theme.textTheme.headlineMedium
                                ?.copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      addVerticalSpacing(10),
                      Row(
                        children: const [
                          Expanded(
                              child: BudgetInsightItem(
                            label: "Spent so far:",
                            inNaira: "00.00",
                            percentage: "00.00",
                            percentageColor: FColors.primaryOrange,
                          )),
                          Expanded(
                              child: BudgetInsightItem(
                            label: "Balance left:",
                            inNaira: "00.00",
                            percentage: "00.00",
                            percentageColor: FColors.primaryGreen,
                          )),
                        ],
                      ),

                      //Transactions section
                      addVertSpace(30),
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Transactions",
                                  style: context.theme.textTheme.headlineMedium
                                      ?.copyWith(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: FStrings.monteserratSemiBold,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "See all",
                                    style: context
                                        .theme.textTheme.headlineMedium
                                        ?.copyWith(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: FColors.primaryBlue,
                                      fontFamily: FStrings.monteserratSemiBold,
                                    ),
                                  ),
                                  addHorizonSpace(6),
                                  const RotatedBox(
                                    quarterTurns: 4,
                                    child: FWidgetsRenderSvg(
                                      iconPath: FIcons.arrowRight,
                                      iconColor: FColors.primaryBlue,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          addVertSpace(13),
                          SizedBox(
                            height: 60,
                            width: double.infinity,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  ...TrasactionDateTile
                                      .transactionDateCategoryList
                                      .map((e) {
                                    return TrasactionDateTile(
                                      activeIndex: 0,
                                      tileIndex: e.index,
                                      label: e.label,
                                    );
                                  }),
                                ],
                              ),
                            ),
                          ),
                          addVerticalSpacing(40),
                          SizedBox(
                            height: 90,
                            child: Center(
                              child: Text(
                                "You have no transaction for the day",
                                style: context.theme.textTheme.headlineMedium
                                    ?.copyWith(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: FColors.primaryGrey,
                                  fontFamily: FStrings.monteserratSemiBold,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
