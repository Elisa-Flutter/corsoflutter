import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:social_media/models/post.dart';
import 'package:social_media/models/post_response.dart';

class ApiPost{
  static String get baseUrl => 'https://dummyapi.io/data/v1';

  static Future<PostResponse> getPostList({int page = 0, int limit = 20}) async{

    final http.Response response = await http.get(
        Uri.parse('$baseUrl/post?page=$page&limit=$limit'),
        headers: {
          'app-id': '626eebd60787bf09ba5c2b33'
        }
    );

    if(response.statusCode == 200){
      return PostResponse.fromJson(jsonDecode(response.body));
    }

    throw Exception('Errore in ricevere i post: ${response.body}');
  }

  static Future<Post> getDetailsFor(String id) async{
    final http.Response response = await http.get(
        Uri.parse('$baseUrl/user/$id'),
        headers: {
          'app-id': '626eebd60787bf09ba5c2b33'
        }
    );

    if(response.statusCode == 200){
      return Post.fromJson(jsonDecode(response.body));
    }

    throw Exception('Errore in ricevere i dettagli dell\'utente: ${response.body}');
  }

  static Future<PostResponse> getPostListByUser(String userId, {int page = 0, int limit = 20}) async{
    final http.Response response = await http.get(
        Uri.parse('$baseUrl/user/$userId/post?page=$page&limit=$limit'),
        headers: {
          'app-id': '626eebd60787bf09ba5c2b33'
        }
    );

    if(response.statusCode == 200){
      return PostResponse.fromJson(jsonDecode(response.body));
    }

    throw Exception('Errore in ricevere i post per utente: ${response.body}');
  }

  static Future<PostResponse> getPostListByTag(String tag, {int page = 0, int limit = 20}) async{
    final http.Response response = await http.get(
        Uri.parse('$baseUrl/tag/$tag/post?page=$page&limit=$limit'),
        headers: {
          'app-id': '626eebd60787bf09ba5c2b33'
        }
    );

    if(response.statusCode == 200){
      return PostResponse.fromJson(jsonDecode(response.body));
    }

    throw Exception('Errore in ricevere i post per tag: ${response.body}');
  }

}
