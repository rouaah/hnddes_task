
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hnndes_task/core/constants/app_colors.dart';

class AppTextField extends StatefulWidget {
  AppTextField(
      {Key? key,

        this.width,
        this.height,
        this.validator,
        this.controller,
        this.labelText,
        this.hintText,
        this.maxLines,
        this.inputType,this.inputFormatters,
        this.onFieldSubmit,this.onSaved
      })
      : super(key: key);
  double? width;
  double? height;
  final TextEditingController? controller;
  String? Function(String?)? validator;
   Function(String val)? onFieldSubmit;
  // final VoidCallback? onFieldSubmit;
  void Function(String? val)? onSaved;
  String? labelText;
  String? hintText;
  int? maxLines;
  TextInputType? inputType;
  List<TextInputFormatter>? inputFormatters;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 6.h),
        width: widget.width ?? 366.w,
        height: widget.height ?? 55.h,
        child: TextFormField(
          // obscureText:isPassword==true && BlocProvider.of<AuthCubit>(context).ispasswordVisablitiy,
          cursorColor: Theme.of(context).primaryColor,
          validator: widget.validator,
          controller: widget.controller,
          maxLines: widget.maxLines ?? 1,
          keyboardType: widget.inputType ?? TextInputType.text,
          inputFormatters: widget.inputFormatters ?? [],
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              contentPadding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 12.w),
              label: Text(widget.labelText ?? ''),
              hintText: widget.hintText,
              // helperText: hintText,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0.r),
                borderSide: BorderSide(color: AppColors.whiteTextColor, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color:Theme.of(context).primaryColor,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(12.r),
              ),

          ),
          textAlign: TextAlign.start,
          onSaved: widget.onSaved,
        ));
  }
}