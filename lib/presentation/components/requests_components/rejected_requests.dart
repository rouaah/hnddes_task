import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/presentation/components/requests_components/request_card.dart';

class RejectedRequests extends StatelessWidget {
  const RejectedRequests({super.key});

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
                return RequsetCard(isRejected: true);
              }),
        ),

      ],
    );

  }
}
