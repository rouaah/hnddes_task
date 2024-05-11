import 'package:equatable/equatable.dart';

class Company extends Equatable{
  final int companyId;
  final String companyName;

  const Company({required this.companyId,required this.companyName});

  factory Company.fromJson(Map<String, dynamic> json) =>Company(companyId:json['id'] , companyName: json['companyName']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.companyId;
    data['companyName'] = this.companyName;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [this.companyId];
}