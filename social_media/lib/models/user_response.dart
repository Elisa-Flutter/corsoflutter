import 'package:json_annotation/json_annotation.dart';
import 'package:social_media/models/user.dart';

part 'user_response.g.dart';

@JsonSerializable(
  explicitToJson: true
)
class UserResponse{
  final int total;
  final int page;
  final int limit;
  final List<User> data;

  const UserResponse({
    required this.page,
    required this.total,
    required this.limit,
    required this.data
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}