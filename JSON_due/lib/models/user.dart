import 'package:json_annotation/json_annotation.dart';

import 'address.dart';
import 'bank.dart';
import 'company.dart';
import 'hair.dart';

part 'user.g.dart';

@JsonSerializable(
  explicitToJson: true
)
class User {
  final int id;
  final String firstName;
  final String lastName;
  final String maidenName;
  final int age;
  final String gender;
  final String email;
  final String phone;
  final String username;
  final String password;
  final String birthDate;
  final String image;
  final String bloodGroup;
  final int height;
  final double weight;
  final String eyeColor;
  final Hair hair;
  final String domain;
  final String ip;
  final Address address;
  final String macAddress;
  final String university;
  final Bank bank;
  final Company company;
  final String ein;
  final String ssn;
  final String userAgent;

  const User(
      {
      required this.maidenName,
      required this.gender,
      required this.email,
      required this.phone,
      required this.username,
      required this.password,
      required this.birthDate,
      required this.bloodGroup,
      required this.height,
      required this.weight,
      required this.eyeColor,
      required this.hair,
      required this.domain,
      required this.ip,
      required this.address,
      required this.macAddress,
      required this.university,
      required this.bank,
      required this.company,
      required this.ein,
      required this.ssn,
      required this.userAgent,
      required this.id,
      required this.firstName,
      required this.lastName,
      required this.age,
      required this.image});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
