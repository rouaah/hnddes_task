import 'package:equatable/equatable.dart';
import 'package:hnndes_task/data/models/leave_model.dart';

enum LeavesStatus{loading, success, error}


// abstract class LeaveListState {
//   const LeaveListState();
// }
//
// final class LeaveListInitial extends LeaveListState {}




class LeaveListState extends Equatable{

  final LeavesStatus status;
  final List<Leave> leaveList;
  final bool hasReachedMax;
  final String errorMessage;

  const LeaveListState({
    this.status = LeavesStatus.loading,
    this.hasReachedMax = false,
    this.leaveList=const [],
    this.errorMessage=''
  });
  LeaveListState copyWith({
    LeavesStatus? status,
    List<Leave>? leaveList,
    bool? hasReachedMax,
    String? errorMessage,
  }){
    return LeaveListState(
      status: status ?? this.status,
      leaveList: leaveList ?? this.leaveList,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status,leaveList,hasReachedMax,errorMessage];
}