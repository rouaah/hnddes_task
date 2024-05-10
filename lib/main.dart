import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hnndes_task/core/themes/app_theme.dart';
import 'package:hnndes_task/presentation/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414,896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:(context,_)=> MaterialApp(
        // navigatorKey: AppKeys.navigatorKey,
        title: 'hnndes task',
        theme: appThemeData[AppTheme.lightTheme],
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.onGenerateRoute,

      ),
    );
  }
}
