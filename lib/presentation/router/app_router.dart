import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hnndes_task/presentation/router/routes.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    // FlutterNativeSplash.remove();
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) => FutureBuilder(
            builder: (context,data)=> const SplashView(), future: Future.wait([

        ]),));

      case Routes.onBoardingViewRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => OnBoardingCubit(),
            child: const OnBoardingScreen(),
          ),
        );

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
