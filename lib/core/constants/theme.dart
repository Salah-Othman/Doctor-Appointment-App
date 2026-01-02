import 'package:doctor_appointment/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.light(),
  appBarTheme: AppBarThemeData(
    backgroundColor: AppColors.backgroundColor,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w700,
      color: Color.fromRGBO(255, 153, 0, 1.0),
      letterSpacing: 1,
    ),
  ),
  scaffoldBackgroundColor: AppColors.backgroundColor,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.primaryColor,
      textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Color.fromRGBO(255, 255, 255, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(16),
      ),
      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    ),
  ),
  inputDecorationTheme: InputDecorationThemeData(
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(237, 237, 237, 1), width: 1),
      borderRadius: BorderRadius.circular(16),
    ),
    fillColor: Color.fromRGBO(253, 253, 253, 1),
    filled: true,
    hintStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Color.fromRGBO(194, 194, 194, 1),
    ),
  ),
  // bottomNavigationBarTheme: BottomNavigationBarThemeData(
  //   backgroundColor: LightColor.backgroundColor,
  //   type: BottomNavigationBarType.fixed,
  //   selectedItemColor: LightColor.primaryColor,
  //   unselectedItemColor: Color.fromRGBO(54, 54, 54, 1),
  //   showUnselectedLabels: true,
  // ),
  // progressIndicatorTheme: ProgressIndicatorThemeData(color: Colors.white),
);
