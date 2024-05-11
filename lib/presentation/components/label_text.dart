import 'package:flutter/material.dart';
import 'package:hnndes_task/core/utils/app_text_styles.dart';

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
            style: AppTextStyles.label1TextStyle,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            maxLines: 6,
            softWrap: true,),
        ),
      ],
    );
  }
}
