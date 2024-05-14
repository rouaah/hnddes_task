
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hnndes_task/core/helpers/cache_helper.dart';
import 'package:hnndes_task/data/repositories/leaves_repository.dart';
import 'package:hnndes_task/logic/leaves/leave_list_bloc/leave_list_event.dart';
import 'package:hnndes_task/logic/leaves/leave_list_bloc/leave_list_state.dart';

class LeaveListBloc extends Bloc<LeaveListEvent, LeaveListState> {
  LeaveListBloc() : super(LeaveListState()) {

    on<GetLeaveListEvent>(onGetLeaveList,transformer: droppable());
  }

  LeavesRepository leavesRepository = LeavesRepository();
  int currentPage = 1 ;
  bool isFirstLoad =false;

  Future<void> onGetLeaveList(GetLeaveListEvent event, Emitter<LeaveListState> emit) async {
    if (state.hasReachedMax) return;
    if (event.firstPage == 1) {
      // if (state.status == LeavesStatus.loading) {

      emit(state.copyWith(leaveList: List.of(state.leaveList)
        ..clear(),status: LeavesStatus.loading,));
      currentPage = 1;

      await leavesRepository.getLeaveList(
          companyId:  CacheHelper.getIntData(key: 'companyId') ?? 0,
          departmentId: CacheHelper.getIntData(key: 'departmentId') ?? 0,
          employeeId: CacheHelper.getIntData(key: 'employeeId') ?? 0,
          pageNumber: currentPage
         ).then((value) => value.fold((l){
        emit(state.copyWith(
            status: LeavesStatus.error,
            errorMessage: l.errorMessage ?? 'failed to fetch stores'));
      }, (r) {
        r.isEmpty
            ? emit(state.copyWith(hasReachedMax: true,status: LeavesStatus.success))
            :r.length < 7 ?
             emit(state.copyWith(
            status: LeavesStatus.success,
            leaveList: r,
            hasReachedMax: true))
            : emit(state.copyWith(
            status: LeavesStatus.success,
            leaveList: r,
            hasReachedMax: false));
      }));
    } else {
      currentPage ++ ;
      await leavesRepository.getLeaveList(
          companyId:  CacheHelper.getIntData(key: 'companyId') ?? 0,
          departmentId: CacheHelper.getIntData(key: 'departmentId') ?? 0,
          employeeId: CacheHelper.getIntData(key: 'employeeId') ?? 0,
          pageNumber: currentPage
      ).then((value) => value.fold((l){
        emit(state.copyWith(
            status: LeavesStatus.error,
            errorMessage: l.errorMessage ?? 'failed to fetch stores'));
      }, (r) {
        r.isEmpty
            ? emit(state.copyWith(hasReachedMax: true))
            : emit(state.copyWith(
            status: LeavesStatus.success,
            leaveList: List.of(state.leaveList)..addAll(r),
            hasReachedMax: false));
      }));
    }
    print(state.leaveList.length);
  }

}



          // if (state.status == PostStatus.loading) {
          //   final posts = await PostsApi.getPosts();
          //   return posts.isEmpty
          //       ? emit(state.copyWith(
          //       status: PostStatus.success, hasReachedMax: true))
          //       : emit(state.copyWith(
          //       status: PostStatus.success,
          //       posts: posts,
          //       hasReachedMax: false));
          // } else {
          //   final posts = await PostsApi.getPosts(state.posts.length);
          //   posts.isEmpty
          //       ? emit(state.copyWith(hasReachedMax: true))
          //       : emit(state.copyWith(
          //       status: PostStatus.success,
          //       posts: List.of(state.posts)..addAll(posts),
          //       hasReachedMax: false));
          // }
