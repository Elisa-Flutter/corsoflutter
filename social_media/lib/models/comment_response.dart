import 'package:json_annotation/json_annotation.dart';
import 'package:social_media/models/comment.dart';

part 'comment_response.g.dart';

@JsonSerializable(
  explicitToJson: true
)
class CommentResponse{
  final int total;
  final int page;
  final int limit;
  final List<Comment> data;

  const CommentResponse({
    required this.page,
    required this.total,
    required this.limit,
    required this.data
  });

  factory CommentResponse.fromJson(Map<String, dynamic> json) => _$CommentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CommentResponseToJson(this);
}