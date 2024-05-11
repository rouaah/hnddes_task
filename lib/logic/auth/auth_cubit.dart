
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hnndes_task/core/helpers/cache_helper.dart';
import 'package:hnndes_task/data/api/dio_helper.dart';
import 'package:hnndes_task/logic/auth/auth_state.dart';


import '../../data/repositories/auth_repository.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  static AuthCubit get(BuildContext context) => BlocProvider.of<AuthCubit>(context);

  AuthRepository authRepository = AuthRepository();

  TextEditingController phoneController = TextEditingController();

  Future<void> loginUser({
    required String userName,required String password
}) async{
    emit(AuthLoadingState());
      await authRepository.userLogin(username: userName, password:password ).then((value) async{
        ///put in sp
        value.fold((l) {
          print(l.errorMessage);
          CacheHelper.saveData(key: 'userToken', value: '');
          CacheHelper.saveData(key: 'userId', value: '0');
          emit(AuthErrorState(errorMsg: l.errorMessage ?? ''));
        },
                (r) {
                  CacheHelper.saveData(key: 'userToken', value: r.token);
                  CacheHelper.saveData(key: 'userId', value: r.userData.id);
                  CacheHelper.saveData(key: 'employeeId', value: r.userData.employee.employeeId);
                  DioHelper.init(token: r.token);
                  emit(AuthenticatedState(user:r.userData));
                } );
      });

  }


}
