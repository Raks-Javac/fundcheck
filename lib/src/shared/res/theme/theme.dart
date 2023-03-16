part of '../res.dart';

abstract class FTheme {
  FTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: FColors.whiteModeBackgroundColor,
      primaryColor: FColors.primaryBlue,
      primaryColorLight: FColors.primaryBlue,
      textTheme: TextTheme(
        bodyMedium: FTypography.bodyMedium.copyWith(color: FColors.black),
        bodyLarge: FTypography.bodyLarge.copyWith(color: FColors.black),
        bodySmall: FTypography.bodySmall.copyWith(color: FColors.black),
        titleLarge: FTypography.titleLarge.copyWith(color: FColors.black),
        titleMedium: FTypography.titleMedium.copyWith(color: FColors.black),
        titleSmall: FTypography.titleSmall.copyWith(color: FColors.black),
        headlineLarge: FTypography.headlineLarge.copyWith(color: FColors.black),
        headlineMedium:
            FTypography.headlineMedium.copyWith(color: FColors.black),
        headlineSmall: FTypography.headlineSmall.copyWith(color: FColors.black),
        labelLarge: FTypography.button.copyWith(color: FColors.black),
        labelSmall: FTypography.caption.copyWith(color: FColors.black),
        //the color scheme requires alot of parameters in the new flutter SDK update
        // colorScheme: ColorScheme(
        //     error: FColors.primaryRed, background: Colors.transparent),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: FColors.darkModeBackgroundColor,
      primaryColor: FColors.primaryBlue,
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
      //the color scheme requires alot of parameters in the new flutter SDK update
      // colorScheme: ColorScheme(
      //     error: FColors.primaryRed, background: Colors.transparent),
    );
  }
}
