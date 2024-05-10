import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/extensions/app_sizes.dart';
import 'package:osta/core/utils/app_text_styles.dart';

class LabelText extends StatelessWidget {
  const LabelText({super.key,required this.labelText,this.padding});
  final String labelText;
  final double? padding;

  @override
  Widget build(BuildContext context) {


    return Wrap(
     alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.start,
      runAlignment: WrapAlignment.start,
      children: [
        Align(
          alignment: AlignmentDirectional.topStart,
          child: Text(labelText,
            style: AppTextStyles.title2TextStyle,
            // TextStyle(fontSize: 18,fontWeight: FontWeight.w700,
              // overflow: TextOverflow.ellipsis,
              // ),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            maxLines: 6,
            softWrap: true,),
        ),
      ],
    );
  }
}