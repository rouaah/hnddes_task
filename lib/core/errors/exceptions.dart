import 'package:equatable/equatable.dart';
import 'package:hnndes_task/core/errors/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const ServerException({
    required this.errorMessageModel,
  });
}
