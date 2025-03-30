import 'package:flutter/material.dart';

import '../../exports.dart';
import 'app_colors.dart';


class ThemesManger {
  static ThemeData get appLightTheme {
    return ThemeData(
      fontFamily: FontConstants.fontFamily,
      scaffoldBackgroundColor: AppColors.scaffoldLighColor,
      appBarTheme: AppBarTheme(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.scaffoldLighColor,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.black.withOpacity(.8)),
      ),
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: AppColors.black,
        shadowColor: AppColors.black,
        elevation: 5,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
      ),
      colorScheme: AppColors.selectedLightSchema,
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      textTheme: const TextTheme(
        titleSmall: TextStyle(
          color: AppColors.textSemiLightColorInLightMode,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        titleMedium: TextStyle(
          color: AppColors.textSemiDarkColorInLightMode,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          color: AppColors.textDarkColorInLightMode,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.all(AppColors.white),
        overlayColor: WidgetStateProperty.all(AppColors.white),
        checkColor: WidgetStateProperty.all(AppColors.checkBoxTextColor),
        side: const BorderSide(
          color: AppColors.checkBoxTextColor,
        ),
      ),
    );
  }

  static ThemeData get appDarkTheme {
    return ThemeData(
      primaryColor: AppColors.primaryDark,
      fontFamily: FontConstants.fontFamily,
      scaffoldBackgroundColor: AppColors.scaffoldDarkColor,
      appBarTheme: AppBarTheme(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.scaffoldDarkColor,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: AppColors.white.withOpacity(.8),
        ),
      ),
      textTheme: TextTheme(
        titleSmall: TextStyle(
          color: AppColors.textSemiLighColorInDarkMode.withOpacity(.4),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        titleMedium: TextStyle(
          color: AppColors.textSemiLighColorInDarkMode.withOpacity(.6),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        titleLarge: const TextStyle(
          color: AppColors.white,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      colorScheme: AppColors.selectedDarkSchema,
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.all(AppColors.white),
        overlayColor: WidgetStateProperty.all(AppColors.white),
        checkColor: WidgetStateProperty.all(AppColors.checkBoxTextColor),
        side: const BorderSide(
          color: AppColors.checkBoxTextColor,
        ),
      ),
    );
  }
}
