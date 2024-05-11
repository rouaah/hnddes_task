import 'package:flutter/material.dart';
import 'package:hnndes_task/core/utils/app_text_styles.dart';


class LongCenteredText extends StatelessWidget {
  const LongCenteredText({super.key,required this.text,this.padding,this.isCenter = true});
final String text;
final double? padding;
final bool? isCenter;
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(text,softWrap: true,style: AppTextStyles.labelTextStyle,
      maxLines: 5,
      textAlign:isCenter == true ? TextAlign.center : TextAlign.start,
      overflow: TextOverflow.ellipsis,
    ));
  }
}
