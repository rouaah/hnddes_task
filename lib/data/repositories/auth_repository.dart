
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

  Future<Either<Failure,AuthResponse>> userLogin({required String username,required String password,}) async {
    if (await networkConnectionInfo.isConnected) {
    try {
    Map<String, dynamic> data =
    {
      "username": username,
      "password": password
  };
    print(data);
    final response = await DioHelper.dio!.post(EndPoints.auth, data: data);
    print('response of dio call auth $response');
    final result = response.data;
    if (response.statusCode == 200) {
    print('result after post login $result');
    final UserModel user = UserModel.fromJson(result['data']['user']);
    print('user iiss: $user') ;
    AuthResponse authResponse = AuthResponse(token: result['data']['accessToken'], userData: user);
    print('authh is $authResponse');
    return right(authResponse);
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel(statusCode: response.statusCode!,statusMessage: response.data['message'], success: false));
    }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }else if(e is ServerException){
        return Left(ServerFailure(errorMessage: e.errorMessageModel.statusMessage));
      }else{
        return Left(ServerFailure(errorMessage: 'oops something went wrong, please try again later! '));
      }
    }}
    else{
      return Left(ServerFailure(errorMessage: 'Please check your internet connection '));
    }
  }

}