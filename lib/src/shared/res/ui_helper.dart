
// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class UIHelper{
  //font size
  static const double kSmallFont = 11.0;
  static const double kMediumFont = 14.0;
  static const double kLargeFont = 24.0;

  // Vertical spacing constants. Adjust to your liking.
  static const double _VerticalSpaceSmall = 10.0;
  static const double _VerticalSpaceMedium = 30.0;
  static const double _VerticalSpaceMediumPlus = 48.0;
  static const double _VerticalSpaceLarge = 60.0;

  // Horizontal spacing constants. Adjust to your liking.
  static const double _HorizontalSpaceSmall = 10.0;
  static const double _HorizontalSpaceMedium = 20.0;
  static const double _HorizontalSpaceLarge = 60.0;

  static const Widget verticalSpaceSmall =
      SizedBox(height: _VerticalSpaceSmall);
  static const Widget verticalSpaceMedium =
      SizedBox(height: _VerticalSpaceMedium);
  static const Widget verticalSpaceMediumPlus =
      SizedBox(height: _VerticalSpaceMediumPlus);
  static const Widget verticalSpaceLarge =
      SizedBox(height: _VerticalSpaceLarge);

  static const Widget horizontalSpaceSmall =
      SizedBox(width: _HorizontalSpaceSmall);
  static const Widget horizontalSpaceMedium =
      SizedBox(width: _HorizontalSpaceMedium);
  static const Widget horizontalSpaceLarge =
      SizedBox(width: _HorizontalSpaceLarge);
}

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double screenAwareSize(double value, BuildContext context,
    {bool width = false}) {
  if (width) {
    return MediaQuery.of(context).size.width * (value / 414);
  } else {
    return MediaQuery.of(context).size.height * (value / 1181);
  }
}

addVertSpace(double doublespace) {
  return SizedBox(
    height: doublespace,
  );
}

addHorizonSpace(double doubleSpace) {
  return SizedBox(
    width: doubleSpace,
  );
}