
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hnndes_task/logic/leaves/leaves_state.dart';

class LeavesCubit extends Cubit<LeavesState> {
  LeavesCubit() : super(LeavesInitial());

}
