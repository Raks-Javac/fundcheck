part of 'res.dart';

abstract class FTheme {
  FTheme._();

  static ThemeData get lightTheme {
    return ThemeData();
  }

  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith();
  }
}
