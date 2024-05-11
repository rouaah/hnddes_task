import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hnndes_task/core/helpers/cache_helper.dart';
import 'package:hnndes_task/core/themes/app_theme.dart';
import 'package:hnndes_task/data/api/dio_helper.dart';
import 'package:hnndes_task/logic/auth/auth_cubit.dart';
import 'package:hnndes_task/logic/debug/app_bloc_observer.dart';
import 'package:hnndes_task/presentation/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.initStorage();
  DioHelper.init(token:await CacheHelper.getStringData(key:'userToken') ?? '');
  Bloc.observer = AppBlocObserver();
  // CacheHelper.getIntData(key: 'userId');
  runApp(
      MultiBlocProvider(providers: [
        BlocProvider(create: (_) => AuthCubit()),

      ],
          child: const App()));
}

class App extends StatelessWidget {
  const App({super.key});

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
