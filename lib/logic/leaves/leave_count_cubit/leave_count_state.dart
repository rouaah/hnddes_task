
import 'package:hnndes_task/data/models/leave_count_model.dart';

abstract class LeaveCountState {
  const LeaveCountState();
}

final class LeaveCountInitial extends LeaveCountState {}

final class GetLeaveCountLoading extends LeaveCountState{}
final class GetLeaveCountSuccess extends LeaveCountState{
  final LeaveCount leaveCount;
  const GetLeaveCountSuccess({required this.leaveCount});
}
final class GetLeaveCountError extends LeaveCountState{
  final String errorMsg;
  const GetLeaveCountError({required this.errorMsg});
}