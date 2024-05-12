import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hnndes_task/core/helpers/cache_helper.dart';
import 'package:hnndes_task/data/models/user_model.dart';
import 'package:hnndes_task/logic/leaves/leave_count_cubit/leave_count_cubit.dart';
import 'package:hnndes_task/logic/leaves/leave_list_bloc/leave_list_bloc.dart';
import 'package:hnndes_task/logic/leaves/leave_list_bloc/leave_list_event.dart';
import 'package:hnndes_task/presentation/router/routes.dart';
import 'package:hnndes_task/presentation/screens/auth_screens/login_screen.dart';
import 'package:hnndes_task/presentation/screens/home_screen/Leaves_screen.dart';

class AppRoutes {

  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    // FlutterNativeSplash.remove();
    switch (routeSettings.name) {
      // case Routes.initialRoute:
      //   return MaterialPageRoute(builder: (context) =>
      //     CacheHelper.getStringData(key: 'userToken').toString() != ''? LeavesScreen() :  LoginScreen()
      //   );
      //
      // case Routes.onBoardingViewRoute:
      //   return MaterialPageRoute(builder: (context) =>
      //       LoginScreen()
      //   );

      case Routes.loginViewRoute:
        return MaterialPageRoute(builder: (context) =>
            LoginScreen()
        );

      case Routes.leavesViewRoute:
        // final args = routeSettings.arguments as UserModel ;
        return MaterialPageRoute(builder: (context) =>
            MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => LeaveCountCubit()..getLeaveCount(employeeId: '6')
    // args.employee.employeeId.toString()),
                ),
                BlocProvider(
                  create: (context) => LeaveListBloc()..add(GetLeaveListEvent(firstPage: 1)),
                ),
              ],
              child: LeavesScreen(),
            )
        );

    // case Routes.onBoardingViewRoute:
    //   return MaterialPageRoute(
    //     builder: (context) => const OnBoardingScreen(),
    //   );

      default:
        return unFoundRoute();
    }
  }

  static Route<dynamic> unFoundRoute() {
    return MaterialPageRoute(
      builder: (context) =>
          Scaffold(
            body: Center(
              child: Text(
                "Un Found Route",
                // style: AppTextStyles.splashTextStyle,
              ),
            ),
          ),
    );
  }
}
