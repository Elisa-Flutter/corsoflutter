// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quotes_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuotesResponse _$QuotesResponseFromJson(Map<String, dynamic> json) =>
    QuotesResponse(
      limit: json['limit'] as int,
      skip: json['skip'],
      total: json['total'] as int,
      quotes: (json['quotes'] as List<dynamic>)
          .map((e) => Quotes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuotesResponseToJson(QuotesResponse instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'skip': instance.skip,
      'total': instance.total,
      'quotes': instance.quotes.map((e) => e.toJson()).toList(),
    };
