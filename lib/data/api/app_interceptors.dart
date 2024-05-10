import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hnndes_task/core/appkeys/app_keys.dart';
import 'package:hnndes_task/core/extensions/app_navigator.dart';
import 'package:hnndes_task/core/helpers/cache_helper.dart';
import 'package:hnndes_task/data/api/endpoints.dart';
import 'package:hnndes_task/data/repositories/auth_repository.dart';
import 'package:hnndes_task/presentation/router/routes.dart';


class AppInterceptors extends InterceptorsWrapper {
  AppInterceptors({required this.dioinstance});
  final Dio? dioinstance;
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');
    options.headers['Authorization'] = 'Bearer ${CacheHelper.getStringData(key: 'userToken')}';
    // options.headers['Content-Type'] = 'application/json';
    super.onRequest(options, handler);
    // return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async{
    debugPrint(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    print(response.statusCode);
    print('onerrrrr');
    // final response = err.response;
    if (response != null &&
        // status code for unauthorized usually 401
        response.statusCode == 401 &&
        // refresh token call maybe fail by it self
        // eg: when refreshToken also is expired -> can't get new accessToken
        // usually server also return 401 unauthorized for this case
        // need to exlude it to prevent loop infinite call
        response.requestOptions.path != EndPoints.refreshTok) {
      // if hasn't not refreshing yet, let's start it
      final isRefreshSuccess = await AuthRepository().refreshToken().then((value) => value.fold(
              (l) {
            print("refresh token fail ${l.errorMessage.toString()}");
            CacheHelper.removeData(key: 'userToken');
            return false;
          }, (r){
        print("refresh token success");
        final refreshResponse = r;
        CacheHelper.saveData(key: 'userToken', value: r);
        return true;
      }));
      if (isRefreshSuccess) {
        // refresh success, loop requests need retry
        //   final retry = await dioinstance!.fetch(.options);
        // return requestNeedRetry.handler.resolve(retry);
        // handler.resolve(await _retry(err.requestOptions));
        response.requestOptions.headers['Authorization'] = 'Bearer ${CacheHelper.getStringData(key: 'userToken')}';
        return handler.resolve(await dioinstance!.fetch(response.requestOptions));
    } else {
    AppKeys.navigatorKey.currentState?.context.navigateAndRemoveUntil(newRoute: Routes.registerNumberViewRoute);

    }
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
    final response = err.response;
    if (response != null &&
        // status code for unauthorized usually 401
        response.statusCode == 401 &&
        // refresh token call maybe fail by it self
        // eg: when refreshToken also is expired -> can't get new accessToken
        // usually server also return 401 unauthorized for this case
        // need to exlude it to prevent loop infinite call
        response.requestOptions.path != EndPoints.refreshTok) {
      // if hasn't not refreshing yet, let's start it
      final isRefreshSuccess = await AuthRepository().refreshToken().then((value) => value.fold(
              (l) {
            print("refresh token fail ${l.errorMessage.toString()}");
            CacheHelper.removeData(key: 'userToken');
            return false;
          }, (r){
        print("refresh token success");
        final refreshResponse = r;
        CacheHelper.saveData(key: 'userToken', value: r);
        return true;
      }));
      if (isRefreshSuccess) {
        // refresh success, loop requests need retry
        //   final retry = await dioinstance!.fetch(.options);
          // return requestNeedRetry.handler.resolve(retry);
        // handler.resolve(await _retry(err.requestOptions));
        err.requestOptions.headers['Authorization'] = 'Bearer ${CacheHelper.getStringData(key: 'userToken')}';
        return handler.resolve(await dioinstance!.fetch(err.requestOptions));
      } else {
        AppKeys.navigatorKey.currentState?.context.navigateAndRemoveUntil(newRoute: Routes.registerNumberViewRoute);

    }
  }
    return handler.next(err);
    // super.onError(err, handler);

}
}
