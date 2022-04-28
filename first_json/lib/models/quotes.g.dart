// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quotes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quotes _$QuotesFromJson(Map<String, dynamic> json) => Quotes(
      id: json['id'] as int,
      quote: json['quote'] as String,
      author: json['author'] as String,
    );

Map<String, dynamic> _$QuotesToJson(Quotes instance) => <String, dynamic>{
      'id': instance.id,
      'quote': instance.quote,
      'author': instance.author,
    };
