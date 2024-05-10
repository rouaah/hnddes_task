import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/extensions/app_navigator.dart';
import 'package:osta/presentation/components/requests_components/request_card.dart';
import 'package:osta/presentation/router/routes.dart';

class InProgressRequests extends StatelessWidget {
  const InProgressRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 8,
              padding: EdgeInsets.symmetric(vertical: 8.h),
              itemBuilder: (context,index){
                return InkWell(
                    onTap: (){
                      context.navigateTo(routeName: Routes.orderTrackerViewRoute);
                    },
                    child: RequsetCard());
              }),
        ),
      ],
    );
  }
}
