import 'package:json_annotation/json_annotation.dart';

part 'bank.g.dart';

@JsonSerializable()
class Bank{
  final String cardExpire;
  final String cardNumber;
  final String cardType;
  final String currency;
  final String iban;

  const Bank({required this.cardType, required this.currency, required this.iban, required this.cardExpire, required this.cardNumber});

  factory Bank.fromJson(Map<String, dynamic> json) => _$BankFromJson(json);

  Map<String, dynamic> toJson() => _$BankToJson(this);
}