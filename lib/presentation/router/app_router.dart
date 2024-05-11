import 'package:flutter/material.dart';
import 'package:hnndes_task/presentation/router/routes.dart';
import 'package:hnndes_task/presentation/screens/auth_screens/login_screen.dart';

class AppRoutes {

  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    // FlutterNativeSplash.remove();
    switch (routeSettings.name){
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) =>
            LoginScreen()
        );

        case Routes.onBoardingViewRoute:
        return MaterialPageRoute(builder: (context) =>
            LoginScreen()
        );

        case Routes.loginViewRoute:
        return MaterialPageRoute(builder: (context) =>
            LoginScreen()
        );

        case Routes.leavesViewRoute:
        return MaterialPageRoute(builder: (context) =>
            LoginScreen()
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
      builder: (context) => Scaffold(
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
