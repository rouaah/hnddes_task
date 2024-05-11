
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hnndes_task/core/errors/error_message_model.dart';
import 'package:hnndes_task/core/errors/exceptions.dart';
import 'package:hnndes_task/core/errors/failure.dart';
import 'package:hnndes_task/core/errors/server_failure.dart';
import 'package:hnndes_task/core/helpers/cache_helper.dart';
import 'package:hnndes_task/core/network_connection/network_connection_info.dart';
import 'package:hnndes_task/data/api/dio_helper.dart';
import 'package:hnndes_task/data/api/endpoints.dart';
import 'package:hnndes_task/data/models/user_info_params.dart';
import 'package:hnndes_task/data/models/user_model.dart';

class AuthRepository {

  final NetworkConnecionInfo networkConnectionInfo = NetworkConnecionInfo();

  Future<Either<Failure,authResponse>> userLogin({required String username,required String password,}) async {
    if (await networkConnectionInfo.isConnected) {
    try {
    Map<String, dynamic> data = {
    "username":username ,
    "password":password,
    };
    final response = await DioHelper.dio!.post(EndPoints.auth, data: data);
    print('response of dio call auth $response');
    final result = response.data;
    if (response.statusCode != 200) {
    throw Exception(result['message']);
    } else {
    print('result after post login$result');
    final UserModel user = UserModel.fromJson(result['data']['user']);
    print('user iiss: $user');
    return right(authResponse(token: result['accessToken'], userData: user));
    }
    } catch (e) {
    if (e is DioException) {
    return Left(ServerFailure.fromDioException(e));
    }else{
    return Left(ServerFailure(errorMessage: e.toString()));
    }
    }}
    else{
    return Left(ServerFailure(errorMessage: 'Please check your internet connection '));
    }
  }

}