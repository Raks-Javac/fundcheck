import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fundcheck/src/core/utils/extensions.dart';
import 'package:fundcheck/src/shared/res/res.dart';
import 'package:fundcheck/src/shared/res/theme/provider/theme/theme_provider.dart';
import 'package:provider/provider.dart';

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
  // ref.watch(themeProvider);

  // final themProviderNotifier = ref.watch(themeProvider.notifier);
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      Provider.of<ThemeProvider>(context, listen: false);
      final themeProviderNotifier = context.watch<ThemeProvider>();
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: activeIndex != tileIndex
            ? BoxDecoration(
                color: themeProviderNotifier.mode == AppThemeMode.dark
                    ? FColors.darkModeBackgroundColor
                    : FColors.tertiaryGrey2,
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
                border: Border.all(
                  color: themeProviderNotifier.mode == AppThemeMode.dark
                      ? FColors.primaryBlue
                      : Colors.transparent,
                ),
              )
            : BoxDecoration(
                color: themeProviderNotifier.mode == AppThemeMode.dark
                    ? FColors.primaryBlue
                    : FColors.tertiaryBlue5,
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
                border: Border.all(
                  width:
                      themeProviderNotifier.mode == AppThemeMode.dark ? 1.0 : 0,
                  color: themeProviderNotifier.mode == AppThemeMode.light
                      ? FColors.primaryBlue
                      : FColors.white,
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
                  ? themeProviderNotifier.mode == AppThemeMode.light
                      ? FColors.tertiaryGrey
                      : FColors.tertiaryGrey.withOpacity(0.8)
                  : themeProviderNotifier.mode == AppThemeMode.dark
                      ? FColors.white
                      : FColors.primaryBlue,
              fontFamily: FStrings.monteserratSemiBold,
            ),
          ),
        ),
      );
    });
  }
}

class TransactionDateObject {
  final String label;
  final int index;
  TransactionDateObject(this.label, this.index);
}
