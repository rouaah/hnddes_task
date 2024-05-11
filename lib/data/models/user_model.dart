
import 'package:equatable/equatable.dart';
import 'package:hnndes_task/data/models/company_model.dart';
import 'package:hnndes_task/data/models/department_model.dart';
import 'package:hnndes_task/data/models/employee_model.dart';

class UserModel extends Equatable{
  final String id;
  final String username;

  final List<Company> companys;
  final List<Department> departments;
  final Employee employee;

  const UserModel(
      {required this.id,
        required this.username,
        required this.companys,
        required this.departments,
        required this.employee});

  factory UserModel.fromJson(Map<String, dynamic> json) =>UserModel(
    id: json['id'] ,
      username: json['username'],
    companys: List<Company>.from(json['companys'].map((x)=> Company.fromJson(x))) ?? [],
    departments: List<Department>.from(json['departments'].map((x)=> Department.fromJson(x)))??[],
    employee: Employee.fromJson(json['employee']),
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.username;
    data['companys'] = List<Company>.from(this.companys!.map((x) => x.toJson()));
    data['departments'] = List<Department>.from(this.departments!.map((x) => x.toJson()));
    data['employee']=this.employee;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [this.id];

}