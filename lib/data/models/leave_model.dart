import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class Leave extends Equatable{
  final int employeeId;
  final int typeId;
  final String absenceFrom;
  final String absenceTo;
  final String? notes;
  final int leaveId;
  final String employeeName;
  final int statusId;
  final String statusName;
  final String absenceValue;
  final String number;

 const Leave({
    required this.employeeId,
    required this.typeId,
    required this.absenceFrom,
    required this.absenceTo,
     this.notes,
    required this.leaveId,
    required this.employeeName,
    required this.statusId,
    required this.statusName,
    required this.absenceValue,
    required this.number,
  });

  factory Leave.fromJson(Map<String, dynamic> json) =>
      Leave(
          employeeId: json['employeeId'],
          typeId: json['typeId'],
          absenceFrom:DateFormat('MMM d, yyyy').format(DateTime.parse(json['absenceFrom']).toLocal()),
          absenceTo:DateFormat('MMM d, yyyy').format(DateTime.parse(json['absenceTo']).toLocal()),
          notes: json['notes'],
          leaveId: json['id'],
          employeeName: json['employeeName'],
          statusId: json['statusId'],
          statusName: json['statusName'],
          absenceValue: json['absenceValue'],
          number: json['number']
      );

  @override
  // TODO: implement props
  List<Object?> get props => [this.leaveId];

}