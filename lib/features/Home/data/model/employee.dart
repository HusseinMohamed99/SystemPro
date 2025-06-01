import 'package:json_annotation/json_annotation.dart';

part 'employee.g.dart';

/// Represents a real estate employee (agent) who added the listing.
@JsonSerializable()
class Employee {
  /// Creates an [Employee] instance with optional id and name.
  const Employee({this.employeeId, this.name});

  /// Creates an [Employee] from a JSON map.
  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);

  /// Converts [Employee] instance to a JSON map.
  Map<String, dynamic> toJson() => _$EmployeeToJson(this);

  /// The unique ID of the employee.
  @JsonKey(name: 'employee_id')
  final int? employeeId;

  /// The employee's full name.
  final String? name;
}
