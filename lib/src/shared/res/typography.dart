part of 'res.dart';

abstract class FTypography {
  FTypography._();

  static const TextStyle headlineLarge = TextStyle(
    fontSize: 34,
    fontFamily: FStrings.monteserratRegular,
  );
  static const TextStyle headlineMedium = TextStyle(
    fontSize: 28,
    fontFamily: FStrings.monteserratRegular,
  );
  static const TextStyle headlineSmall = TextStyle(
    fontSize: 22,
    fontFamily: FStrings.monteserratRegular,
  );
  static TextStyle subtitle = const TextStyle(
    fontSize: 11.5,
    fontFamily: FStrings.monteserratRegular,
  );
  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontFamily: FStrings.monteserratRegular,
  );
  static const TextStyle caption = TextStyle(
    fontSize: 11,
    fontFamily: FStrings.monteserratRegular,
  );
  static const TextStyle titleLarge = headlineLarge;
  static const TextStyle titleMedium = headlineMedium;
  static const TextStyle titleSmall = headlineLarge;
  static const TextStyle body = TextStyle(
    fontSize: 13,
    color: FColors.black,
    fontFamily: FStrings.monteserratRegular,
  );
  static TextStyle bodyLarge = body.copyWith(fontSize: 17);
  static TextStyle bodyMedium = body.copyWith(fontSize: 14);
  static TextStyle bodySmall = body.copyWith(fontSize: 11);
}



// TextTheme TextTheme({
//   TextStyle? displayLarge,
//   TextStyle? displayMedium,
//   TextStyle? displaySmall,
//   TextStyle? headlineLarge,
//   TextStyle? headlineMedium,
//   TextStyle? headlineSmall,
//   TextStyle? titleLarge,
//   TextStyle? titleMedium,
//   TextStyle? titleSmall,
//   TextStyle? bodyLarge,
//   TextStyle? bodyMedium,
//   TextStyle? bodySmall,
//   TextStyle? labelLarge,
//   TextStyle? labelMedium,
//   TextStyle? labelSmall,
//   TextStyle? headline1,
//   TextStyle? headline2,
//   TextStyle? headline3,
//   TextStyle? headline4,
//   TextStyle? headline5,
//   TextStyle? headline6,
//   TextStyle? subtitle1,
//   TextStyle? subtitle2,
//   TextStyle? bodyText1,
//   TextStyle? bodyText2,
//   TextStyle? caption,
//   TextStyle? button,
//   TextStyle? overline,
// })