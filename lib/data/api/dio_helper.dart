import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hnndes_task/data/api/app_interceptors.dart';
import 'package:hnndes_task/data/api/endpoints.dart';


class DioHelper {
  static Dio? dio;

  static init({String token = ""}) {
    dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUrl,
        validateStatus: (status) {
          return status! <= 500;
        },
        receiveDataWhenStatusError: true,
        followRedirects: false,
        headers: {
          "authorization": "Bearer $token",
          // "Accept-Language": AppLocalizations().locale!.languageCode,
          "Accept": "application/json",
        },
      ),
    );
    dio!.interceptors.addAll([
      AppInterceptors(dioinstance: dio),
      // AuthInterceptor(dio!)
    ]
    );

    if (kDebugMode) {
      dio!.interceptors.add(LogInterceptor());
    }
  }

}
