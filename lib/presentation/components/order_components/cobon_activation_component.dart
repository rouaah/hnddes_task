import 'package:flutter/material.dart';
import 'package:osta/core/extensions/app_sizes.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/presentation/components/app_button.dart';
import 'package:osta/presentation/components/app_text_field.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';

class CobonActivationComponent extends StatelessWidget {
  const CobonActivationComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LabelText(labelText: 'order_details.do_you_have_a_discount_code?'.tr(context),padding: 25,),
            Container(
              margin: EdgeInsets.only(right: 10),
              padding: const EdgeInsets.all(8.0),
              child: AppButton(onTap: (){}, buttonText: 'order_details.activate'.tr(context),btnWidth: context.width*0.22,btnHeight: context.height*0.045,),
            )
          ],
        ),
        AppTextField(hintText: '#####',width: context.width*0.9,)
      ],
    );
  }
}
