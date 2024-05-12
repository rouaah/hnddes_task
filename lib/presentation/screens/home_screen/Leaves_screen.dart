import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hnndes_task/core/constants/app_colors.dart';
import 'package:hnndes_task/core/helpers/cache_helper.dart';
import 'package:hnndes_task/core/utils/app_text_styles.dart';
import 'package:hnndes_task/data/models/leave_model.dart';
import 'package:hnndes_task/logic/leaves/leave_count_cubit/leave_count_cubit.dart';
import 'package:hnndes_task/logic/leaves/leave_count_cubit/leave_count_cubit.dart';
import 'package:hnndes_task/logic/leaves/leave_count_cubit/leave_count_state.dart';
import 'package:hnndes_task/logic/leaves/leave_list_bloc/leave_list_bloc.dart';
import 'package:hnndes_task/logic/leaves/leave_list_bloc/leave_list_event.dart';
import 'package:hnndes_task/logic/leaves/leave_list_bloc/leave_list_state.dart';
import 'package:hnndes_task/presentation/components/custom_app_bar.dart';
import 'package:hnndes_task/presentation/components/leaves_components/annual_leaves_curve.dart';
import 'package:hnndes_task/presentation/components/leaves_components/leave_card.dart';

class LeavesScreen extends StatefulWidget {
  const LeavesScreen({super.key});

  @override
  State<LeavesScreen> createState() => _LeavesScreenState();
}

class _LeavesScreenState extends State<LeavesScreen> {
  final scrollController = ScrollController();

  void initState() {
    super.initState();
    scrollController.addListener(onScroll);
  }

  void dispose() {
    scrollController
      ..removeListener(onScroll)
      ..dispose();
    super.dispose();
  }

  int page = 1;

  void onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    if (currentScroll >= (maxScroll * 0.8)) {
      // context.read<AllWorkersCubit>().getAllWorkers(pageNum: page+1);
      context.read<LeaveListBloc>().add(GetLeaveListEvent());
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          drawer: Drawer(),
          appBar: CustomAppBar(
            title: 'My Leaves',
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_outlined,
                    size: 22.h,
                  )),
              CircleAvatar(
                radius: 20.r,
                backgroundColor: Colors.black12,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.person,
                    size: 22.h,
                    color: AppColors.primaryColor,
                  ),
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            controller: scrollController,
            physics: AlwaysScrollableScrollPhysics(),
            child: SizedBox(
              // height: 900.h,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 38.h,
                  ),
                  BlocBuilder<LeaveCountCubit, LeaveCountState>(
                    buildWhen: (previous,
                        current) => current is GetLeaveCountSuccess,
                    builder: (context, state) {
                      if (state is GetLeaveCountSuccess)
                        return AnnualLeavesCurve(
                            userName: 'userName', leaveCount:
                        state.leaveCount.annual + state.leaveCount.death +
                            state.leaveCount.marriage + state.leaveCount
                            .maternity +
                            state.leaveCount.sickness +
                            state.leaveCount.workAccident +
                            state.leaveCount.unpaid + state.leaveCount.others

                            , maxLeaves: state.leaveCount.maxAnnual);
                      else
                        return SizedBox();
                    },
                  ),
                  BlocBuilder<LeaveListBloc, LeaveListState>(
                    builder: (context, state) {
                      return state.status == LeavesStatus.loading
                          ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      )
                          : state.status == LeavesStatus.error
                          ? Center(
                        child: Text(state.errorMessage),
                      )
                          : state.status == LeavesStatus.success
                          ? state.leaveList.isEmpty
                          ? Center(
                        child: Text('There is No Leaves yet'),
                      )
                          : Expanded(
                          flex: 0,
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics:
                              NeverScrollableScrollPhysics(),
                              itemCount: state.hasReachedMax
                                  ? state.leaveList.length
                                  : state.leaveList.length + 1,
                              itemBuilder: (context, index) {
                                return index >=
                                    state.leaveList.length
                                ?
                                state.status ==
                                    LeavesStatus.error
                                ? Center(
                                child: Text(
                                    state.errorMessage),
                                )
                                    :
                                     Center(
                                  child:
                                  CircularProgressIndicator(
                                    color: AppColors
                                        .primaryColor,
                                  ),
                                )
                                    : LeaveCard(
                                    leave:
                                    state.leaveList[index]
                                  // Leave(
                                  //     employeeId: 1,
                                  //     typeId: 1,
                                  //     absenceFrom: '22',
                                  //     absenceTo: '25',
                                  //     leaveId: 2,
                                  //     employeeName: 'kkkk',
                                  //     statusId: 2,
                                  //     statusName: 'statusName',
                                  //     absenceValue: 'absenceValue',
                                  //     number: '2')
                                );
                              }))
                          : SizedBox();
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}