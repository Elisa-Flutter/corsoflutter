import 'package:json_annotation/json_annotation.dart';

part 'quotes.g.dart';

@JsonSerializable()
class Quotes{
  final int id;
  final String quote;
  final String author;

  const Quotes({
    required this.id,
    required this.quote,
    required this.author
  });

  factory Quotes.fromJson(Map<String, dynamic> json) => _$QuotesFromJson(json);

  Map<String, dynamic> toJson() => _$QuotesToJson(this);
}