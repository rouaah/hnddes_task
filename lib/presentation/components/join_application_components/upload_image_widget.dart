import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/extensions/app_sizes.dart';

class UploadWidget extends StatelessWidget {
  const UploadWidget({super.key,required this.isCircleWidget});
  final bool isCircleWidget ;

  @override
  Widget build(BuildContext context) {
    return Center(
      child:DottedBorder(
          borderType: isCircleWidget ? BorderType.Circle : BorderType.RRect,
          color: Colors.grey,
          strokeWidth: 1,strokeCap: StrokeCap.butt,dashPattern: [5, 5,],
          child: Container(
              width:isCircleWidget ? 204.w : 364.w,
              height: isCircleWidget ? 204.w: 117.h,
              child: Icon(Icons.add,size: 40.w,))),
    );
  }
}
