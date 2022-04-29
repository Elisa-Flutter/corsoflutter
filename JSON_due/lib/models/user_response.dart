import 'package:json_annotation/json_annotation.dart';
import 'package:json_due/models/user.dart';

part 'user_response.g.dart';

@JsonSerializable(
    explicitToJson: true
)
class UserResponse{
  final int limit;
  final dynamic skip;
  final int total;
  final List<User> users;


  const UserResponse({required this.limit, required this.skip, required this.total, required this.users});

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);

}