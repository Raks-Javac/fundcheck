
import 'package:flutter/material.dart';
import 'package:fundcheck/src/core/utils/extensions.dart';

class TransactionView extends StatelessWidget {
  const TransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: const Center(child: Text('Transaction View')),
    );
  }
}