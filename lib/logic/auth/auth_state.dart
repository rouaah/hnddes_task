
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
class AuthErrorState extends AuthState {
  final String errorMsg ;
  const AuthErrorState({required this.errorMsg});
}