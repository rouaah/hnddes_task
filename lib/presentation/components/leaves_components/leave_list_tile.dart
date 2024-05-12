import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hnndes_task/core/utils/app_text_styles.dart';

class LeaveListTile extends StatelessWidget {
   LeaveListTile({Key? key,required this.icon,required this.title,required this.subtitle,required this.color}) : super(key: key);
  IconData icon;
  String title;
  String subtitle;
  Color color;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Icon(icon,color: color,size: 30.w),backgroundColor: color.withOpacity(0.2),radius: 30.r,),
      title: Text(title,style: AppTextStyles.subtitle1Style),
      subtitle: Text(subtitle ,style: AppTextStyles.label1TextStyle,),

    );
  }
}
