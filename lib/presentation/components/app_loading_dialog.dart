import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
            // height: 100.h,
            // width: context.width*0.07,
            decoration: BoxDecoration(
              color:Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            padding: EdgeInsets.all(18.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[ CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
                backgroundColor: Colors.white,
              ),
                SizedBox(height: 8.h,),
                Text('Loading ...')
      ]
            ),
      ),
    );
  }
}
