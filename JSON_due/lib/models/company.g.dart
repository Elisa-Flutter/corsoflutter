// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      department: json['department'] as String,
      name: json['name'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'address': instance.address.toJson(),
      'department': instance.department,
      'name': instance.name,
      'title': instance.title,
    };
