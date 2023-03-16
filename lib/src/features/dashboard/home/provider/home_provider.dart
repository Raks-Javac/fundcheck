import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = StateNotifierProvider((ref) => HomeProvider());

class HomeProvider extends StateNotifier {
  HomeProvider() : super(null);
}
