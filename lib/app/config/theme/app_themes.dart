import 'package:flutter/material.dart';
import 'package:timetocode/app/config/theme/colors.dart';
// import 'package:timetocode/themes/typography.dart';

class AppThemes {
  static ThemeData darkTheme = ThemeData(
    // === Colors ===
    scaffoldBackgroundColor: AppColors.darkBackground,
    primaryColor: AppColors.technoBlue,
    cardColor: AppColors.surfaceDark,
    dividerColor: AppColors.primaryText,

    // === AppBar Theme ===
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.surfaceDark,
      elevation: 0,
    ),

    // === Bottom Navigation Bar Theme ===
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.surfaceDark,
      selectedItemColor: AppColors.skyByte,
      unselectedItemColor: AppColors.primaryText,
    ),

    splashColor: Colors.transparent,
    highlightColor: AppColors.deepAzure,
    hoverColor: Colors.transparent,

    // === Text Theme ===
    // textTheme: TextTheme(
    //   displayLarge: AppTypography.heading1(),
    //   displayMedium: AppTypography.heading2(),
    //   displaySmall: AppTypography.heading3(),

    //   headlineLarge: AppTypography.heading4(),
    //   headlineMedium: AppTypography.heading5(),
    //   headlineSmall: AppTypography.heading6(),

    //   titleLarge: AppTypography.mediumBold(),
    //   titleMedium: AppTypography.normalBold(),
    //   titleSmall: AppTypography.smallBold(),

    //   bodyLarge: AppTypography.large(),
    //   bodyMedium: AppTypography.normal(),
    //   bodySmall: AppTypography.small(),

    //   labelLarge: AppTypography.medium(),
    //   labelMedium: AppTypography.normal(),
    //   labelSmall: AppTypography.small(),
    // ),
  );
}
