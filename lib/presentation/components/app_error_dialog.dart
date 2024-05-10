import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osta/core/extensions/app_sizes.dart';

import '../../core/constants/app_colors.dart';
import '../../logic/themes/themes_cubit.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({super.key, required this.errorText});

  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child:  Container(
              height: context.height * 0.4,
              // width: context.width * 0.8,
              decoration: BoxDecoration(
                  // color: state.brightness == Brightness.light
                  //     ? Colors.white
                  //     : AppColors.darkGreyColor,
                  // borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
              child: Center(
                  child: AlertDialog(
                      title: Text('something went wrong'),
                      content: Text(errorText),
                      actions: <Widget>[
                        TextButton(
                          child: Text("OK"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                      contentPadding: EdgeInsets.all(8))))
    );
  }
}
