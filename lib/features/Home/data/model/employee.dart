import 'package:json_annotation/json_annotation.dart';

part 'employee.g.dart';

@JsonSerializable()
class Employee {
  Employee({this.employeeId, this.name});

  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);
  @JsonKey(name: 'employee_id')
  final int? employeeId;
  final String? name;
}
