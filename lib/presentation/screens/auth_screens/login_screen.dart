import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hnndes_task/core/appkeys/app_keys.dart';
import 'package:hnndes_task/core/appkeys/auth_keys.dart';
import 'package:hnndes_task/core/extensions/app_navigator.dart';
import 'package:hnndes_task/core/helpers/cache_helper.dart';
import 'package:hnndes_task/logic/auth/auth_cubit.dart';
import 'package:hnndes_task/logic/auth/auth_cubit.dart';
import 'package:hnndes_task/logic/auth/auth_state.dart';
import 'package:hnndes_task/logic/leaves/leave_count_cubit/leave_count_cubit.dart';
import 'package:hnndes_task/logic/leaves/leave_list_bloc/leave_list_bloc.dart';
import 'package:hnndes_task/logic/leaves/leave_list_bloc/leave_list_event.dart';
import 'package:hnndes_task/presentation/components/app_button.dart';
import 'package:hnndes_task/presentation/components/app_error_dialog.dart';
import 'package:hnndes_task/presentation/components/app_loading_dialog.dart';
import 'package:hnndes_task/presentation/components/app_text_field.dart';
import 'package:hnndes_task/presentation/components/label_text.dart';
import 'package:hnndes_task/presentation/components/long_centered_text.dart';
import 'package:hnndes_task/presentation/router/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(

      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) async{
          if (state is AuthenticatedState) {
            context.getBack();
            context.navigateAndRemoveUntil(
                newRoute: Routes.leavesViewRoute,arguments:await CacheHelper.getStringData(key: 'userName') );
            // context.read<LeaveListBloc>().add(GetLeaveListEvent(firstPage: 1));
            // Future.wait([
            // context.read<LeaveCountCubit>().getLeaveCount(employeeId: '6'),
            // ]);
          }
          if (state is AuthLoadingState) {
            showAdaptiveDialog<Widget>(
              context: context,
              barrierDismissible: true,
              builder: (context) => const LoadingDialog(),
            );
          }
          if (state is AuthErrorState) {
            context.getBack();
            showAdaptiveDialog<Widget>(
              context: context,
              builder: (context) => ErrorDialog(errorText: state.errorMsg),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Form(
              key: AuthKeys.loginFormKey,
              child: Column(
                children: [
                  SizedBox(
                      height: 55.5.h
                  ),
                  Image.asset('assets/images/Welcome@2x.png',
                      width: 366.82.w,
                      height: 219.38.h),
                  // Image.asset('assets/images/login_image.png',width: double.infinity,),
                  SizedBox(
                    height: 30.12.h,
                  ),
                  LongCenteredText(text: 'Please Login To Your Account'),
                  SizedBox(height: 28.h,),
                  LabelText(labelText: 'USERNAME / EMAIL'),
                  AppTextField(
                    controller: userNameController,
                    validator: (val){
                      if(val == null || val.isEmpty){
                        return 'please enter your username or email';
                      }
                      return null ;
                    },
                  ),
                  SizedBox(height: 18.h,),
                  LabelText(labelText: 'PASSWORD'),
                  AppTextField(
                    controller: passwordController,
                    validator: (val){
                      if(val == null || val.isEmpty){
                        return 'please enter your password';
                      }
                      return null ;
                    },
                  ),
                  SizedBox(height: 49.h,),
                  AppButton(onTap: () async{
                    if(AuthKeys.loginFormKey.currentState!.validate()) {
                      await context.read<AuthCubit>().loginUser(userName: userNameController.text, password: passwordController.text);
                    }
                    }, buttonText: 'Login'),
                  SizedBox(height: 183.h,),
                ],
              ),
            ),
          );
        },
      ),
    ));
  }
}
