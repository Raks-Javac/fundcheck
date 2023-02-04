part of 'res.dart';

abstract class FTheme {
  FTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: FColors.whiteModeBackgroundColor,
      primaryColor: FColors.primaryBlue,
      errorColor: FColors.primaryRed,
      primaryColorLight: FColors.primaryBlue,
      textTheme: TextTheme(
        bodyMedium: FTypography.bodyMedium,
        bodyLarge: FTypography.bodyLarge,
        bodySmall: FTypography.bodySmall,
        caption: FTypography.caption,
        titleLarge: FTypography.titleLarge,
        titleMedium: FTypography.titleMedium,
        titleSmall: FTypography.titleSmall,
        headlineLarge: FTypography.headlineLarge,
        headlineMedium: FTypography.headlineMedium,
        headlineSmall: FTypography.headlineSmall,
        button: FTypography.button,
        displayLarge: FTypography.bodyLarge,
        displayMedium: FTypography.bodyMedium,
        displaySmall: FTypography.bodySmall,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: FColors.darkModeBackgroundColor,
      primaryColor: FColors.primaryBlue,
      errorColor: FColors.primaryRed,
      primaryColorLight: FColors.primaryBlue,
      textTheme: TextTheme(
        bodyMedium: FTypography.bodyMedium,
        bodyLarge: FTypography.bodyLarge,
        bodySmall: FTypography.bodySmall,
        caption: FTypography.caption,
        titleLarge: FTypography.titleLarge,
        titleMedium: FTypography.titleMedium,
        titleSmall: FTypography.titleSmall,
        headlineLarge: FTypography.headlineLarge,
        headlineMedium: FTypography.headlineMedium,
        headlineSmall: FTypography.headlineSmall,
        button: FTypography.button,
        displayLarge: FTypography.bodyLarge,
        displayMedium: FTypography.bodyMedium,
        displaySmall: FTypography.bodySmall,
      ),
    );
  }
}
