import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hnndes_task/core/constants/app_colors.dart';

class AppTextStyles {

  static TextStyle labelTextStyle = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.darkTextColor,
  );
  static TextStyle label1TextStyle = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textColor,
  );
  static TextStyle btnTextStyle = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.whiteTextColor,
  );

  static TextStyle whiteTitleTextStyle = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteTextColor,
  );

  static TextStyle subtitleStyle = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.grey,
  );
  static TextStyle subtitle1Style = TextStyle(
    fontSize: 15.sp,
    // fontWeight: FontWeight.w500,
    color: AppColors.grey,
  );

}