part of 'res.dart';

abstract class FTheme {
  FTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: FColors.whiteModeBackgroundColor,
      primaryColor: FColors.primaryBlue,
      errorColor: FColors.primaryRed,
      primaryColorLight: FColors.primaryBlue,
      textTheme: TextTheme(),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: FColors.darkModeBackgroundColor,
      primaryColor: FColors.primaryBlue,
      errorColor: FColors.primaryRed,
      primaryColorLight: FColors.primaryBlue,
      textTheme: TextTheme(),
    );
  }
}
