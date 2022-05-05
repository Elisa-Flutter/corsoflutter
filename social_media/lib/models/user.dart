import 'package:json_annotation/json_annotation.dart';
import 'package:social_media/models/location.dart';

part 'user.g.dart';

@JsonSerializable(
    explicitToJson: true
)
class User{
  final String? id;
  final String? title;
  final String firstName;
  final String lastName;
  final String? gender;
  final String? email;
  final String? dateOfBirth;
  final String? registerDate;
  final String? phone;
  final String? picture;
  final Location? location;

  const User({
    this.id,
    this.title,
    required this.firstName,
    required this.lastName,
    this.gender,
    this.email,
    this.dateOfBirth,
    this.registerDate,
    this.phone,
    this.picture,
    this.location,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);


}