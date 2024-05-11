import 'package:equatable/equatable.dart';
import 'package:hnndes_task/data/models/company_model.dart';
import 'package:hnndes_task/data/models/department_model.dart';

class Employee extends Equatable{
 final int employeeId;
 final String fullName;
 final Company company;
 final Department department;

const Employee({
  required this.employeeId,
  required this.fullName,
  required this.company,
  required this.department,
});

  factory Employee.fromJson(Map<String, dynamic> json) =>Employee(
      employeeId:json['id'] ,
      fullName: json['fullName'],
      company:  Company.fromJson(json['company']),
      department: Department.fromJson(json['department']),
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.employeeId;
    data['fullName'] = this.fullName;
    data['company'] = this.company.toJson();
    data['department'] = this.department.toJson();
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [this.employeeId];

}