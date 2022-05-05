import 'package:json_annotation/json_annotation.dart';
import 'package:social_media/models/user.dart';

part 'post.g.dart';

@JsonSerializable(
    explicitToJson: true
)
class Post{
  final String? id;
  final String? text;
  final String? image;
  final int? likes;
  final String? link;
  final List<String>? tags;
  final String? publishDate;
  final User owner;

  const Post({
    this.id,
    this.text,
    this.image,
    this.likes,
    this.link,
    this.tags,
    this.publishDate,
    required this.owner,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);

}