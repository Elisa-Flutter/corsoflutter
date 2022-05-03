import 'package:json_annotation/json_annotation.dart';
import 'package:social_media/models/user.dart';

part 'comment.g.dart';

@JsonSerializable(
  explicitToJson: true
)
class Comment{
  final String id;
  final String message;
  final User owner;
  final String post;
  final String? publishDate;

  const Comment({
   required this.id,
   required this.message,
   required this.owner,
   required this.post,
   this.publishDate,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}