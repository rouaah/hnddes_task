import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ErrorDialog extends StatelessWidget {
  const ErrorDialog({super.key, required this.errorText,this.btnText,this.btnFunc});

  final String errorText;
  final String? btnText;
  final Function()? btnFunc;

  @override
  Widget build(BuildContext context) {
    return Center(
      child:  Container(
              // height: context.height * 0.4,
              // width: context.width * 0.8,

              child: Center(
                  child: AlertDialog(
                      title: Text('something went wrong'),
                      content:Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 8.h),
                        child: Text(errorText,softWrap: true,textAlign: TextAlign.start,),
                      ) ,
                      actions: <Widget>[
                        TextButton(
                          child: Text(btnText ?? "Okay"),
                          onPressed: btnFunc ?? () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                      contentPadding: EdgeInsets.all(8.w))))
    );
  }
}
