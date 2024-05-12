import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hnndes_task/data/models/leave_model.dart';
import 'package:hnndes_task/presentation/components/leaves_components/leave_list_tile.dart';

class LeaveCard extends StatelessWidget {
  LeaveCard({Key? key,required this.leave}) : super(key: key);
  Leave leave;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r),side: BorderSide(width: 1,color: Colors.black12)),
      margin: EdgeInsets.symmetric(horizontal: 14.w,vertical: 5.h),
      child: Column(
        children: [
          LeaveListTile(icon: Icons.date_range_outlined,title: 'Applied Duration',subtitle: '${leave.absenceFrom} to ${leave.absenceTo} ',color: Colors.pinkAccent.withOpacity(0.2),),
          LeaveListTile(icon: Icons.message_outlined,title: 'Reason',subtitle: leave.absenceValue,color: Colors.purpleAccent.withOpacity(0.2),),
          // AppListTile(icon: Icons.message_outlined,title: 'Notes',subtitle: leave.notes ?? 'no Notes',color: Colors.blueAccent.withOpacity(0.2),),
          LeaveListTile(icon: Icons.shopping_bag_outlined,title: 'Types of Leave',subtitle: leave.statusName,color: Colors.purple.withOpacity(0.2),),
        ],
      ),
    );
  }
}
