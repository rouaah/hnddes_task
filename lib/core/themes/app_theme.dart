
import 'package:flutter/material.dart';
import 'package:hnndes_task/core/constants/app_colors.dart';

enum AppTheme{
  lightTheme,
  darkTheme;
  const AppTheme();
}

final appThemeData = {
  AppTheme.lightTheme : ThemeData(
    // useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: 'Cairo',
    primaryColor: AppColors.primaryColor,
    primaryColorLight: AppColors.primaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor:Colors.transparent,
      // AppColors.lightBackgroundColor,
      elevation: 0,
        // titleTextStyle: AppTextStyles.labelTextStyle,
        centerTitle: false,
        iconTheme: IconThemeData(color: AppColors.secondaryColor ,
opacity: 1,
        ),
      ),
    iconTheme: IconThemeData(
      color: AppColors.textColor,
      size: 20,
    ),
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))
    ),
    dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      backgroundColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 2,
          padding: EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          backgroundColor:AppColors.primaryColor,
          foregroundColor: Colors.white,
          // textStyle:AppTextStyles.buttonTextStyle
      ),
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            foregroundColor: MaterialStateProperty.all(AppColors.primaryColor ),
          // textStyle:MaterialStateProperty.all( AppTextStyles.buttonTextStyle)
        )),
      cardColor: Colors.white,
    backgroundColor: AppColors.lightBackgroundColor,
    scaffoldBackgroundColor: AppColors.lightBackgroundColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryColor,
      
    )
  ),
};