import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hnndes_task/core/constants/app_colors.dart';
import 'package:hnndes_task/core/utils/app_text_styles.dart';


class AppButton extends StatelessWidget {
  AppButton(
      {Key? key,
        required this.onTap,
        required this.buttonText,
        this.btnWidth,
        this.btnHeight,
        this.color,
      })
      : super(key: key);
  Function() onTap;
  String buttonText;
  double? btnWidth;
  double? btnHeight;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: btnWidth ?? 366.w,
      height: btnHeight ?? 56.h,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: color ?? AppColors.primaryColor,
          ) ,
          onPressed: onTap,
          child: Text(buttonText,
              style:AppTextStyles.btnTextStyle,
              // TextStyle(color:Colors.white,fontSize: 18.sp,fontWeight: FontWeight.w700)),
        ),
        ),
      ),
    );
  }
}