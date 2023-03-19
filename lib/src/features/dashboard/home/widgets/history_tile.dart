import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fundcheck/src/core/utils/enum.dart';
import 'package:fundcheck/src/core/utils/extensions.dart';
import 'package:fundcheck/src/shared/res/res.dart';

class HistoryTile extends StatelessWidget {
  final TileCategoryEnum categoryEnum;
  final String subtitle;
  final VoidCallback? onTap;
  final String? title;
  final bool isDeducted;
  final String amount;
  const HistoryTile({
    super.key,
    required this.categoryEnum,
    required this.subtitle,
    this.title,
    this.isDeducted = true,
    this.amount = "₦0.00",
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap!();
      },
      leading: CircleAvatar(
        backgroundColor: FColors.cardGreyTileColor.withOpacity(0.1),
        child: Image.asset(
          HistoryTile.returnIconBasedOnCategory(categoryEnum),
          width: 34,
          height: 28,
        ),
      ),
      title: Text(
        title ?? HistoryTile.returnStringTitleBasedOnCategory(categoryEnum),
        style: context.theme.textTheme.headlineMedium?.copyWith(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          // color: FColors.primaryGrey,
          fontFamily: FStrings.monteserratSemiBold,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: context.theme.textTheme.headlineMedium?.copyWith(
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
          color: FColors.tertiaryGrey,
          fontFamily: FStrings.monteserratSemiBold,
        ),
      ),
      trailing: Text(
        amount,
        style: context.theme.textTheme.headlineMedium?.copyWith(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: isDeducted == true ? FColors.primaryRed : FColors.primaryGreen,
          fontFamily: FStrings.monteserratSemiBold,
        ),
      ),
    );
  }

  static String returnIconBasedOnCategory(TileCategoryEnum category) {
    switch (category) {
      case TileCategoryEnum.food:
        return FIcons.foodIcon;
      case TileCategoryEnum.health:
        return FIcons.healthIcon;
      case TileCategoryEnum.transport:
        return FIcons.transportIcon;

      default:
        return FIcons.transportIcon;
    }
  }

  static String returnStringTitleBasedOnCategory(TileCategoryEnum category) {
    switch (category) {
      case TileCategoryEnum.food:
        return "Food";
      case TileCategoryEnum.health:
        return "Health";
      case TileCategoryEnum.transport:
        return "Transport";

      default:
        return "Default";
    }
  }

  static TileCategoryEnum returnEnumBasedOnCategory(String category) {
    switch (category) {
      case "Food":
        return TileCategoryEnum.food;
      case "Health":
        return TileCategoryEnum.health;
      case "Transport":
        return TileCategoryEnum.transport;

      default:
        return TileCategoryEnum.transport;
    }
  }
}

class TransactionHistoryObject {
  String amount;
  TileCategoryEnum tileEnum;
  String subTitle;
  String title;
  TransactionHistoryObject(
      this.amount, this.tileEnum, this.title, this.subTitle);

  static List<String> listOfCategories() {
    List<String> titles = [];
    transactions.forEach((key, value) {
      titles.add(key);
    });
    return titles;
  }

  static List<TransactionHistoryObject> returnListBasedOnCatgories(
      String category) {
    List<TransactionHistoryObject> transList = [];
    for (final lister in transactions[category]!) {
      transList.add(lister);
    }
    return transList;
  }

  static double sumAllAmountAndReturnTotal(
      List<TransactionHistoryObject> listOfTransactions) {
    double total = 0.00;
    for (final items in listOfTransactions) {
      total += double.parse(items.amount);
    }

    return total;
  }

  static Map<String, List<TransactionHistoryObject>> transactions = {
    "Food": [
      TransactionHistoryObject(
        "200.00",
        TileCategoryEnum.food,
        "Alfredo Pasta at Lekki",
        "Today",
      ),
      TransactionHistoryObject(
        "200.00",
        TileCategoryEnum.food,
        "Alfredo Pasta at Lekki",
        "Today",
      ),
      TransactionHistoryObject(
        "200.00",
        TileCategoryEnum.food,
        "Alfredo Pasta at Lekki",
        "Today",
      ),
    ],
    "Transport": [
      TransactionHistoryObject(
        "200.00",
        TileCategoryEnum.transport,
        "Alfredo Pasta at Lekki",
        "Today",
      ),
      TransactionHistoryObject(
        "200.00",
        TileCategoryEnum.transport,
        "Alfredo Pasta at Lekki",
        "Today",
      ),
      TransactionHistoryObject(
        "200.00",
        TileCategoryEnum.transport,
        "Alfredo Pasta at Lekki",
        "Today",
      ),
      TransactionHistoryObject(
        "200.00",
        TileCategoryEnum.transport,
        "Alfredo Pasta at Lekki",
        "Today",
      ),
      TransactionHistoryObject(
        "200.00",
        TileCategoryEnum.transport,
        "Alfredo Pasta at Lekki",
        "Today",
      ),
    ],
    "Health": [
      TransactionHistoryObject(
        "200.00",
        TileCategoryEnum.health,
        "Alfredo Pasta at Lekki",
        "Today",
      ),
    ],
  };
}
