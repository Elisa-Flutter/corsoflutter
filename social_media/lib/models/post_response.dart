import 'package:json_annotation/json_annotation.dart';
import 'package:social_media/models/post.dart';

part 'post_response.g.dart';

@JsonSerializable()
class PostResponse{
  final List<Post> data;
  final int total;
  final int page;
  final int limit;


  const PostResponse({
    required this.data,
    required this.total,
    required this.page,
    required this.limit,
});

  //PARTE DE POST_RESPONSE.G <- GENERATED

  factory PostResponse.fromJson(Map<String, dynamic> json) => _$PostResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PostResponseToJson(this);
}