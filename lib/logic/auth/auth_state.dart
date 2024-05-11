
import 'package:equatable/equatable.dart';
import '../../data/models/user_model.dart';

abstract class AuthState extends Equatable{
  const AuthState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthenticatedState extends AuthState {
  final UserModel user;
  AuthenticatedState({required this.user});
}

class UnAuthenticatedState extends AuthState {}

class AuthErrorState extends AuthState {
  final String errorMsg ;
  const AuthErrorState({required this.errorMsg});
}
class AuthCodeSentState extends AuthState {}

class AuthCodeVerifiedState extends AuthState {}

class AuthNewUserSuccessState extends AuthState {}
class AuthSuccesstate extends AuthState {}

class CodeEnteredEmptyState extends AuthState {}
class CodeEnteredShortState extends AuthState {}
class CodeEnteredUnmatchState extends AuthState {}

class GetDeviceInfoLoadingState extends AuthState{}
class GetDeviceInfoSuccessState extends AuthState {
  final String deviceTok;
  const GetDeviceInfoSuccessState({required this.deviceTok});
}
class GetDeviceInfoErrorState extends AuthState {
  final String errorMsg;
  const GetDeviceInfoErrorState({required this.errorMsg});
}
