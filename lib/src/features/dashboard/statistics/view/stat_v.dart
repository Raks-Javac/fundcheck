
 import 'package:flutter/material.dart';
import 'package:fundcheck/src/core/utils/extensions.dart';

class StatisticView extends StatelessWidget {
  const StatisticView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: const Center(
        child: Text('Statistics View')
      )
    );
  }
}