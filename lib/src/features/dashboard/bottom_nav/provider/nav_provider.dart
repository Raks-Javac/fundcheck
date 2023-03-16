import 'package:flutter_riverpod/flutter_riverpod.dart';

final navProvider = StateNotifierProvider((ref) => NavProvider(0));

class NavProvider extends StateNotifier<int> {
  NavProvider(super.state);
  static int activeIndexVal = 0;
  int get activeIndex => activeIndexVal;

  set activeIndex(int index) {
    activeIndexVal = index;
  }

  changeActiveIndexstate(int index) {
    activeIndex = state = index;
  }
}
