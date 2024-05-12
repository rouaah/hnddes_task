
import 'package:equatable/equatable.dart';

abstract class LeaveListEvent extends Equatable{
  const LeaveListEvent();
  @override
// TODO: implement props
  List<Object?> get props => [];
}
class GetLeaveListEvent extends LeaveListEvent{
  final int? firstPage;

  const GetLeaveListEvent({this.firstPage});
}

