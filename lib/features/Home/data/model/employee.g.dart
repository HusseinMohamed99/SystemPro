// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employee _$EmployeeFromJson(Map<String, dynamic> json) => Employee(
  employeeId: (json['employee_id'] as num?)?.toInt(),
  name: json['name'] as String?,
);

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
  'employee_id': instance.employeeId,
  'name': instance.name,
};
