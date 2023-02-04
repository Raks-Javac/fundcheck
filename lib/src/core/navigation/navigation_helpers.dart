import 'package:flutter/material.dart';

abstract class FNavigator {
  FNavigator._();
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  pushSTo() {}

  pushRemoveUtil() {}

  pushAndReplace() {}
}
