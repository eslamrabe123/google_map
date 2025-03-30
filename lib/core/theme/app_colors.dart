import 'package:flutter/material.dart';

import '../../exports.dart';

class AppColors {
  AppColors._();
  static const primary = Color(0xff002C6D);
  static const primaryDark = Color(0xff7C82AC);
  static const secondary = Color(0xff0055D3);
  static const secondaryDark = Color(0xff9599BD);
  static const secondaryInDark = Color(0xFF3F3F3F);
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
  static const scaffoldLighColor = Color(0xFFF9FAFC);
  static const scaffoldDarkColor = Color(0xFF121212);
  static const checkBoxTextColor = Color(0xFF5E84A3);
  static const gery = Color(0xFFF3F4F6);
  static const geryInDark = Color(0xFF282828);
  static const unreadMessageColor = Color(0xFF288B54);
  static const textFieldLightFillColor = Color(0xFFFFFFFF);
  static const textFieldDarkFillColor = Color.fromARGB(255, 36, 35, 35);
  static const forgotPasswordDarkColor = Color.fromARGB(255, 36, 35, 35);
  static const forgotPasswordLightColor = Color.fromARGB(255, 36, 35, 35);
  static const errorMessageLightColor = Color.fromARGB(255, 244, 61, 61);
  static const errorMessageDarkColor = Color.fromARGB(255, 244, 61, 61);
  static const passwordEyeIconLightColor = Color(0xff002C6D);
  static const passwordEyeIconDarkColor = Color(0xfff5f7fa);

  //* Text colors in light mode
  static const textDarkColorInLightMode = Color(0xFF111827);
  static const textSemiDarkColorInLightMode = Color(0xFF374151);
  static const textSemiLightColorInLightMode = Color(0xFF9ca3af);
  static const textSemiLighColorInDarkMode = Color(0xFFF9FAFB);
  static const redColor = Color(0xFFE11D48);

  static AppColorScheme selectedLightSchema = AppColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: AppColors.white,
    secondary: AppColors.secondary,
    onSecondary: AppColors.gery,
    shadow: AppColors.black.withOpacity(.4),
    surface: AppColors.white,
    onSurface: AppColors.textFieldLightFillColor,
    error: AppColors.errorMessageLightColor,
    // onBackground: Color(0xff160D5D),
    // outline: Color(0xFF636363),
  );

  static AppColorScheme selectedDarkSchema = AppColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.primaryDark,
    onPrimary: AppColors.secondaryInDark,
    secondary: AppColors.secondaryDark,
    onSecondary: AppColors.secondaryInDark,
    shadow: AppColors.white.withOpacity(.4),
    surface: AppColors.geryInDark,
    onSurface: AppColors.textFieldDarkFillColor,
    error: AppColors.errorMessageDarkColor,

    // error: Color(0xffb00020),
    // onBackground: Color(0xff160D5D),
    // surface: Color(0xff1f222a),
    // outline: Color(0xFF636363),
  );
}
