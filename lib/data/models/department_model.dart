import 'package:equatable/equatable.dart';

class Department extends Equatable{
  final int departmentId;
  final String departmentName;

  const Department({required this.departmentId,required this.departmentName});

  factory Department.fromJson(Map<String, dynamic> json) =>Department(departmentId:json['id'] , departmentName: json['departmentName']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.departmentId;
    data['departmentName'] = this.departmentName;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [this.departmentId];
}