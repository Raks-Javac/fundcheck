import 'package:flutter/material.dart';

class NavProvider extends ChangeNotifier {
  NavProvider({int});
  static int activeIndexVal = 0;
  int get activeIndex => activeIndexVal;

  set activeIndex(int index) {
    activeIndexVal = index;
  }

  changeActiveIndexstate(int index) {
    activeIndex = index;
    notifyListeners();
  }
}
