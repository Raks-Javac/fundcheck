import 'package:flutter/material.dart';
import 'package:fundcheck/src/features/dashboard/home/widgets/history_tile.dart';
import 'package:fundcheck/src/shared/widgets/app_bar/primary_app_bar.dart';

class TransactionDetailsView extends StatelessWidget {
  final String categoryTitle;
  final List<TransactionHistoryObject> transactionslist;
  const TransactionDetailsView(
      {super.key, required this.categoryTitle, required this.transactionslist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: FWidgetsPrimaryAppBar(title: categoryTitle),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ...transactionslist.map((e) {
                return HistoryTile(
                  categoryEnum: e.tileEnum,
                  subtitle: e.subTitle,
                  amount: "₦${e.amount}",
                  onTap: () {},
                  title: e.title,
                );
              })
            ],
          ),
        ));
  }
}
