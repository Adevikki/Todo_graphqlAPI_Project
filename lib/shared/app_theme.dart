import 'package:flutter/material.dart';
import 'package:flutter_todo_app_test/shared/colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData themeData = ThemeData(
      colorScheme: _colorScheme,
      textTheme: _textTheme,
      iconTheme: _iconTheme,
      scaffoldBackgroundColor: AppColors.white,
      toggleableActiveColor: AppColors.green,
      toggleButtonsTheme: ToggleButtonsThemeData(
          fillColor: AppColors.lightGrey,
          borderColor: AppColors.grey,
          borderRadius: BorderRadius.circular(6)));

  static const ColorScheme _colorScheme = ColorScheme(
    primary: AppColors.primaryColor,
    primaryVariant: AppColors.grey,
    background: AppColors.white,
    brightness: Brightness.light,
    secondary: AppColors.orange,
    secondaryVariant: AppColors.lightOrange,
    surface: AppColors.white,
    onBackground: AppColors.black,
    onError: AppColors.white,
    onPrimary: AppColors.white,
    onSecondary: AppColors.white,
    onSurface: AppColors.white,
    error: AppColors.errorColor,
  );

  static const TextTheme _textTheme = TextTheme(
    headline5: TextStyle(
      color: AppColors.black,
      fontSize: 24,
      fontWeight: FontWeight.w500,
    ),
    headline6: TextStyle(
      color: AppColors.white,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    bodyText2: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: AppColors.black,
    ),
    bodyText1: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 12,
      color: AppColors.black,
    ),
    button: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
  );
  static const IconThemeData _iconTheme = IconThemeData(color: AppColors.white);
}