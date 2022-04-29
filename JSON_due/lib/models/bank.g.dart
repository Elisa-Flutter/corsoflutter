// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bank _$BankFromJson(Map<String, dynamic> json) => Bank(
      cardType: json['cardType'] as String,
      currency: json['currency'] as String,
      iban: json['iban'] as String,
      cardExpire: json['cardExpire'] as String,
      cardNumber: json['cardNumber'] as String,
    );

Map<String, dynamic> _$BankToJson(Bank instance) => <String, dynamic>{
      'cardExpire': instance.cardExpire,
      'cardNumber': instance.cardNumber,
      'cardType': instance.cardType,
      'currency': instance.currency,
      'iban': instance.iban,
    };
