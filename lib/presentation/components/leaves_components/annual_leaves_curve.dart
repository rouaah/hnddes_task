import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hnndes_task/core/constants/app_colors.dart';
import 'package:hnndes_task/core/utils/app_text_styles.dart';
import 'package:hnndes_task/presentation/components/leaves_components/custom_clipper.dart';

class AnnualLeavesCurve extends StatelessWidget {
  AnnualLeavesCurve(
      {Key? key,
      required this.userName,
      required this.leaveCount,
      required this.maxLeaves})
      : super(key: key);
  String userName;
  int leaveCount;
  double maxLeaves;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyCustomClipper(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 38.w, vertical: 12.h),
        color: AppColors.primaryColor.withOpacity(0.5),
        height: 180.h,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userName, style: AppTextStyles.btnTextStyle,
              // TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 10.h,
            ),
            ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                child: LinearProgressIndicator(
                    value: leaveCount / maxLeaves,
                    minHeight: 10.h,
                    color: AppColors.secondaryColor)),
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('$leaveCount leaves',
                    style: AppTextStyles.whiteTitleTextStyle),
                SizedBox(
                  width: 200.w,
                ),
                Text('$maxLeaves leaves',
                    style: AppTextStyles.whiteTitleTextStyle)
              ],
            )
          ],
        ),
      ),
    );
  }
}
