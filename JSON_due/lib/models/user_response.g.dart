// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      limit: json['limit'] as int,
      skip: json['skip'],
      total: json['total'] as int,
      users: (json['users'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'skip': instance.skip,
      'total': instance.total,
      'users': instance.users.map((e) => e.toJson()).toList(),
    };
