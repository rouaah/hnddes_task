import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/core/utils/app_text_styles.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';
import 'package:osta/presentation/components/offer_slider.dart';
import 'package:osta/presentation/components/requests_components/request_card.dart';

class CompletedRequests extends StatelessWidget {
  const CompletedRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OfferSlider(),
        SizedBox(height: 24.h,),
        Text('requests.please_rate_our_services'.tr(context),style: AppTextStyles.labelTextStyle,softWrap: true,textAlign: TextAlign.start),
        SizedBox(height: 16.h,),
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 8,
              padding: EdgeInsets.symmetric(vertical: 8.h),
              itemBuilder: (context,index){
                return RequsetCard();
              }),
        ),

      ],
    );
  }
}
