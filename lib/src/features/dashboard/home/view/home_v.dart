import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundcheck/src/core/utils/extensions.dart';
import 'package:fundcheck/src/features/dashboard/home/provider/home_provider.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(homeProvider);

    // final homeStateNotifier = ref.watch(homeProvider.notifier);
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: const Center(child: Text('Home View')),
    );
  }
}
