import 'package:flutter/material.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            "OnBoarding",
            style: theme.textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}
