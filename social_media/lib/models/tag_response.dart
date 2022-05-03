import 'package:json_annotation/json_annotation.dart';

part 'tag_response.g.dart';

@JsonSerializable()
class TagResponse{
  final int total;
  final int page;
  final int limit;
  final List<String> data;

  const TagResponse({
    required this.page,
    required this.total,
    required this.limit,
    required this.data
  });

  factory TagResponse.fromJson(Map<String, dynamic> json) => _$TagResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TagResponseToJson(this);
}