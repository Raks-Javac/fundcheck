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
        bodyMedium: FTypography.bodyMedium.copyWith(),
        bodyLarge: FTypography.bodyLarge.copyWith(),
        bodySmall: FTypography.bodySmall.copyWith(),
        titleLarge: FTypography.titleLarge,
        titleMedium: FTypography.titleMedium,
        titleSmall: FTypography.titleSmall,
        headlineLarge: FTypography.headlineLarge,
        headlineMedium: FTypography.headlineMedium,
        headlineSmall: FTypography.headlineSmall,
        labelLarge: FTypography.button,
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
        bodyMedium: FTypography.bodyMedium.copyWith(color: FColors.white),
        bodyLarge: FTypography.bodyLarge.copyWith(color: FColors.white),
        bodySmall: FTypography.bodySmall.copyWith(color: FColors.white),
        titleLarge: FTypography.titleLarge.copyWith(color: FColors.white),
        titleMedium: FTypography.titleMedium.copyWith(color: FColors.white),
        titleSmall: FTypography.titleSmall.copyWith(color: FColors.white),
        headlineLarge: FTypography.headlineLarge.copyWith(color: FColors.white),
        headlineMedium:
            FTypography.headlineMedium.copyWith(color: FColors.white),
        headlineSmall: FTypography.headlineSmall.copyWith(color: FColors.white),
        labelLarge: FTypography.button.copyWith(color: FColors.white),
      ),
    );
  }
}
