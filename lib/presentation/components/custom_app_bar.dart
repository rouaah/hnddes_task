import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hnndes_task/core/utils/app_text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;


  @override
  final Size preferredSize;

  CustomAppBar({required this.title,this.actions})
      : preferredSize = Size.fromHeight(50.h);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
    child: AppBar(
      title:
      Text(title,style: AppTextStyles.labelTextStyle,),
      centerTitle: true,
      actions: actions ?? [],
    )
      );
  }
}