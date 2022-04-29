import 'package:json_annotation/json_annotation.dart';
import 'package:json_due/models/address.dart';

part 'company.g.dart';

@JsonSerializable(
  explicitToJson: true
)
class Company{
  final Address address;
  final String department;
  final String name;
  final String title;

  const Company({required this.address, required this.department, required this.name, required this.title});

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}