import 'package:json_due/models/quotes.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quotes_response.g.dart';

@JsonSerializable(
  explicitToJson: true
)
class QuotesResponse{
  final int limit;
  final dynamic skip;
  final int total;
  final List<Quotes> quotes;

  QuotesResponse({
    required this.limit,
    required this.skip,
    required this.total,
    required this.quotes
  });


  factory QuotesResponse.fromJson(Map<String, dynamic> json) => _$QuotesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuotesResponseToJson(this);
}