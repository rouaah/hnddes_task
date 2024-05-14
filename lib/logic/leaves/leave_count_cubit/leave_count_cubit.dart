
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hnndes_task/core/helpers/cache_helper.dart';
import 'package:hnndes_task/data/repositories/leaves_repository.dart';
import 'package:hnndes_task/logic/leaves/leave_count_cubit/leave_count_state.dart';


class LeaveCountCubit extends Cubit<LeaveCountState> {
  LeaveCountCubit() : super(LeaveCountInitial());
  static LeaveCountCubit get(BuildContext context) => BlocProvider.of<LeaveCountCubit>(context);

  LeavesRepository leavesRepository = LeavesRepository();

  Future<void> getLeaveCount(
    // required String employeeId,
  ) async{
    emit(GetLeaveCountLoading());
    await leavesRepository.getEmployeeLeavesCount(employeeId: CacheHelper.getIntData(key: 'employeeId')??0).then((value) async{
      ///put in sp
      value.fold((l) {
        print(l.errorMessage);
        emit(GetLeaveCountError(errorMsg: l.errorMessage ?? ''));
      },
              (r) {
            emit(GetLeaveCountSuccess(leaveCount: r));
          } );
    });

  }

}
