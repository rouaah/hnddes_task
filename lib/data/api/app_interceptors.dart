import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hnndes_task/core/appkeys/app_keys.dart';
import 'package:hnndes_task/core/extensions/app_navigator.dart';
import 'package:hnndes_task/core/helpers/cache_helper.dart';
import 'package:hnndes_task/data/api/endpoints.dart';
import 'package:hnndes_task/data/repositories/auth_repository.dart';
import 'package:hnndes_task/presentation/components/app_error_dialog.dart';
import 'package:hnndes_task/presentation/router/routes.dart';


class AppInterceptors extends InterceptorsWrapper {
  AppInterceptors({required this.dioinstance});
  final Dio? dioinstance;
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');
    // options.headers['Authorization'] = 'Bearer ${await CacheHelper.getStringData(key: 'userToken')}';
    // options.headers['Content-Type'] = 'application/json';
    super.onRequest(options, handler);
    // return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async{
    debugPrint(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    print(response.statusCode);
    // final response = err.response;
    if (
    // response != null &&
        // status code for unauthorized usually 401
        response.statusCode == 401) {
         await CacheHelper.removeData(key: 'userToken');

            // AppKeys.navigatorKey.currentState?.context.navigateAndRemoveUntil(newRoute: Routes.loginViewRoute);
            AppKeys.navigatorKey.currentContext != null ? await showAdaptiveDialog(
              context: AppKeys.navigatorKey.currentContext!,
              barrierDismissible: false,
              builder: (context) => ErrorDialog(errorText:'Session Expired', btnText: 'Logout',
                  btnFunc: ()=> AppKeys.navigatorKey.currentState?.context.navigateAndRemoveUntil(newRoute: Routes.loginViewRoute)  ),
            ) : AppKeys.navigatorKey.currentState?.context.navigateAndRemoveUntil(newRoute: Routes.loginViewRoute);

    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    debugPrint(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions
            .path}');
    print(err.response?.statusCode);
    print('onerrrrr');
    return handler.next(err);

}

}
