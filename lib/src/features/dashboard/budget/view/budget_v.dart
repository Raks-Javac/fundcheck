
 import 'package:flutter/material.dart';
import 'package:fundcheck/src/core/utils/extensions.dart';

class BudgetView extends StatelessWidget {
  const BudgetView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: const Center(
        child: Text('Budget View')
      )
    );
  }
}