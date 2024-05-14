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
import 'package:hnndes_task/data/models/leave_count_model.dart';
import 'package:hnndes_task/data/models/leave_model.dart';

class LeavesRepository {
  final NetworkConnecionInfo networkConnectionInfo = NetworkConnecionInfo();

  Future<Either<Failure, LeaveCount>> getEmployeeLeavesCount({
    required int employeeId,
  }) async {
    if (await networkConnectionInfo.isConnected) {
      try {
        final response =
            await DioHelper.dio!.get('${EndPoints.leaveCount}/$employeeId');
        print('response of dio call leaves count $response');
        final result = response.data;
        if (response.statusCode == 200) {
          final LeaveCount leaveCount = LeaveCount.fromJson(result['data']);
          return right(leaveCount);
        } else {
          throw ServerException(
              errorMessageModel: ErrorMessageModel(
                  statusCode: response.statusCode!,
                  statusMessage: response.data['message'],
                  success: false));
          // Exception(result['message']);
        }
      } catch (e) {
        if (e is DioException) {
          return Left(ServerFailure.fromDioException(e));
        } else if (e is ServerException) {
          return Left(
              ServerFailure(errorMessage: e.errorMessageModel.statusMessage));
        } else {
          return Left(ServerFailure(
              errorMessage:
                  'oops something went wrong, please try again later! '));
        }
      }
    } else {
      return Left(ServerFailure(
          errorMessage: 'Please check your internet connection '));
    }
  }

  Future<Either<Failure, List<Leave>>> getLeaveList(
  {
    required int companyId,
  required int departmentId,
  required int employeeId,
  required int pageNumber,
   String? pageSize
}) async {
    if (await networkConnectionInfo.isConnected) {
      try {
        Map<String,dynamic> data = {
          "companyId": companyId,
          "departmentId": departmentId,
          "employeeId": employeeId,
          "pageNumber": pageNumber,
          "pageSize": 7
        };
        final response = await DioHelper.dio!.get(
          EndPoints.leaveList ,
          options: Options(headers: data)
        );
        if (response.statusCode == 200) {
          print('response of dio call get leave list $response');
          final List<Leave> leaveList = List<Leave>.from(
                  response.data['data']['leaves'].map((x) => Leave.fromJson(x))) ;
          return Right(leaveList);
        } else {
          throw ServerException(
              errorMessageModel: ErrorMessageModel(
                  statusCode: response.statusCode!,
                  statusMessage: response.data['message'],
                  success: false));
        }
      } catch (e) {
        if (e is DioException) {
          return Left(ServerFailure.fromDioException(e));
        } else if (e is ServerException) {
          return Left(
              ServerFailure(errorMessage: e.errorMessageModel.statusMessage));
        } else {
          return Left(ServerFailure(
            errorMessage: "Oops something went wrong, please try again later!",
          ));
        }
      }
    } else {
      return Left(ServerFailure(
          errorMessage: 'Please check your internet connection '));
    }
  }
}
