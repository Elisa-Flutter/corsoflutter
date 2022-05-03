import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:social_media/models/comment_response.dart';
import 'package:social_media/models/post.dart';
import 'package:social_media/models/post_response.dart';

class ApiComment{
  static String get baseUrl => 'https://dummyapi.io/data/v1';

  static Future<CommentResponse> getCommentList({int page = 0, int limit = 20}) async{

    final http.Response response = await http.get(
        Uri.parse('$baseUrl/comment?page=$page&limit=$limit'),
        headers: {
          'app-id': '626eebd60787bf09ba5c2b33'
        }
    );

    if(response.statusCode == 200){
      return CommentResponse.fromJson(jsonDecode(response.body));
    }

    throw Exception('Errore in ricevere i post: ${response.body}');
  }


  static Future<CommentResponse> getCommentByUser(String userId, {int page = 0, int limit = 20}) async{
    final http.Response response = await http.get(
        Uri.parse('$baseUrl/user/$userId/comment?page=$page&limit=$limit'),
        headers: {
          'app-id': '626eebd60787bf09ba5c2b33'
        }
    );

    if(response.statusCode == 200){
      return CommentResponse.fromJson(jsonDecode(response.body));
    }

    throw Exception('Errore in ricevere i post per utente: ${response.body}');
  }

  static Future<CommentResponse> getCommentForPost(String postId, {int page = 0, int limit = 20}) async{
    final http.Response response = await http.get(
        Uri.parse('$baseUrl/post/$postId/comment?page=$page&limit=$limit'),
        headers: {
          'app-id': '626eebd60787bf09ba5c2b33'
        }
    );

    if(response.statusCode == 200){
      return CommentResponse.fromJson(jsonDecode(response.body));
    }

    throw Exception('Errore in ricevere i post per tag: ${response.body}');
  }

}
