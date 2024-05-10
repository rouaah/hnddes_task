
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hnndes_task/core/errors/failure.dart';
import 'package:hnndes_task/core/network_connection/network_connection_info.dart';
import 'package:hnndes_task/data/api/dio_helper.dart';
import 'package:hnndes_task/data/api/endpoints.dart';
import 'package:hnndes_task/data/models/user_info_params.dart';
import 'package:hnndes_task/data/models/user_model.dart';
import 'package:osta/core/errors/error_message_model.dart';
import 'package:osta/core/errors/exceptions.dart';
import 'package:osta/core/errors/failure.dart';
import 'package:osta/core/errors/server_failure.dart';
import 'package:osta/core/helpers/cache_helper.dart';

import 'package:osta/core/network_connection/network_connection_info.dart';
import 'package:osta/data/api/dio_helper.dart';
import 'package:osta/data/api/endpoints.dart';
import 'package:osta/data/models/user_info_params.dart';
import 'package:osta/data/models/user_model.dart';

class AuthRepository {

  final NetworkConnecionInfo networkConnectionInfo = NetworkConnecionInfo();
  UserModel? user;

  AuthRepository();




  Future<Either<Failure,authResponse>> registerUser({String? tok,String? deviceToken,}) async {
    if (await networkConnectionInfo.isConnected) {
    try {
      Map<String, dynamic> data = {"firebase_token": tok,
        // "phoneNumber":phoneNumber
        "device_token":deviceToken
      };
      print(data);
      final response = await DioHelper.dio!.post(EndPoints.auth, data: data);
      print('response of dio call auth $response');
      final result = response.data;
      if(response.statusCode == 200 ) {
        if (result.containsKey('message')) {
          throw Exception(result['message']);
        } else {
          print('result after decoding$result');
          final UserModel user = UserModel.fromJson(result['user']);
          print('user iiss: $user');
          return right(authResponse(token: result['token'], userData: user));
        }
      }else{
        throw ServerException(errorMessageModel: ErrorMessageModel(statusCode: response.statusCode!,statusMessage: response.data['message'],success: false));

      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }     else if (e is ServerException) {
        return Left(ServerFailure(errorMessage: e.errorMessageModel.statusMessage));
      }else{
      return Left(ServerFailure(errorMessage: e.toString()));
    }
    }}
    else{
      return Left(ServerFailure(errorMessage: 'Please check your internet connection '));
    }
  }

  Future<Either<Failure,String>> refreshToken() async {
    if (await networkConnectionInfo.isConnected) {
    try {
      print('calling refresh token');
      final response = await DioHelper.dio!.post(EndPoints.refreshTok, );
      print('response of dio call refresh $response');
      final result = response.data;

          if (result.statusCode == 200) {
            CacheHelper.saveData(key: 'token', value: result['token']);
            return right(result['token']);

      }else{
        CacheHelper.removeData(key: 'token');
        throw ServerException(errorMessageModel: ErrorMessageModel(statusCode: response.statusCode!,statusMessage: response.data['message'],success: false));
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }     else if (e is ServerException) {
        return Left(ServerFailure(errorMessage: e.errorMessageModel.statusMessage));
      }else{
      return Left(ServerFailure(errorMessage: e.toString()));
    }
    }}
    else{
      return Left(ServerFailure(errorMessage: 'Please check your internet connection '));
    }
  }

  Future<Either<Failure,bool>> signout() async {
    if (await networkConnectionInfo.isConnected) {
      try {
        bool logoutSuccess = false;
        await _auth.signOut().then((value) async{
          final response = await DioHelper.dio!.post(EndPoints.logout,);
          if(response.statusCode == 200 || response.statusCode == 401){
            logoutSuccess = true ;
            return right(logoutSuccess);
          }
          else{
            throw ServerException(errorMessageModel: ErrorMessageModel(statusCode: response.statusCode!,statusMessage: response.data['message'],success: false));
          }
        });
        return right(logoutSuccess);
       // throw Exception('something went wrong');

      } catch (e) {
        if (e is DioException) {
          return Left(ServerFailure.fromDioException(e));
        }     else if (e is ServerException) {
          return Left(ServerFailure(errorMessage: e.errorMessageModel.statusMessage));
        }else{
          return Left(ServerFailure(errorMessage: e.toString()));
        }
      }}
    else{
      return Left(ServerFailure(errorMessage: 'Please check your internet connection '));
    }
  }
}