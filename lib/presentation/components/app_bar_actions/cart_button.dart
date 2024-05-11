import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hnndes_task/core/constants/app_colors.dart';


class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.w),
      child: CircleAvatar(
        radius: 52.r,
        backgroundColor: Colors.white,
        foregroundColor: AppColors.secondaryColor,
        child: IconButton(onPressed: (){
        },icon: Icon(Icons.notifications_outlined,size: 24.w,),),
      ),
    );
  }
}
