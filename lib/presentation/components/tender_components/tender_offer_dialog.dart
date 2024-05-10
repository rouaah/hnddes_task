import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/constants/app_colors.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/core/utils/app_text_styles.dart';
import 'package:osta/presentation/components/app_button.dart';
import 'package:osta/presentation/components/app_outlined_button.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';

class TenderOfferDialog extends StatelessWidget {
  const TenderOfferDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 295.h,
      width: 364.w,
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30.h,),
             CircleAvatar(
               backgroundColor: AppColors.primaryColor,
               child: Image.asset('assets/images/osta_logo.png',width: 56.w,height: 56.h,),
             ),
              SizedBox(height: 14.h,),
              Text('tender.please_register_your_company_in_osta77_to_access_the_rest_of_the_details'.tr(context) ,
              style: AppTextStyles.labelTextStyle,
                maxLines: 5,
                softWrap: true,
              ),
              SizedBox(height: 28.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppButton(onTap: (){}, buttonText: 'common.join_us'.tr(context) ,btnWidth: 150.w),
                  SizedBox(width: 28.w,),
                  AppOutlinedButton(onTap: (){}, buttonText:'common.cancel'.tr(context),btnWidth: 150.w,)
                ],
              ),
              SizedBox(
                height: 32.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
