import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hnndes_task/data/api/status_codes.dart';
import 'failure.dart';

class ServerFailure extends Failure {
  ServerFailure({String? errorMessage}) : super(errorMessage: errorMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errorMessage: 'Connection Timeout With ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: 'Send Timeout With ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: 'Receive Timeout With ApiServer');

      case DioExceptionType.badCertificate:
        return ServerFailure(
            errorMessage: 'Your request not found, please try again later!');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );

      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: 'Request to ApiServer was canceled');

      case DioExceptionType.connectionError:
        return ServerFailure(errorMessage: 'No Internet Connection');

      case DioExceptionType.unknown:
        return ServerFailure(
          errorMessage: "Unexpected Error, please try again!",
        );

      default:
        return ServerFailure(
          errorMessage: "Oops something went wrong, please try again later!",
        );
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    final parsedResponse = jsonDecode(response);

    if (statusCode == StatusCodes.badRequest ||
        statusCode == StatusCodes.unAuthorized ||
        statusCode == StatusCodes.forbidden) {
      return ServerFailure(errorMessage: parsedResponse['message']);
    } else if (statusCode == StatusCodes.internalServerError) {
      return ServerFailure(errorMessage: parsedResponse['error']);
    }
    return ServerFailure(errorMessage: "Opps something went wrong, please try again later!");
  }
}
