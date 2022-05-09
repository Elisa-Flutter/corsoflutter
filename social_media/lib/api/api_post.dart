import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
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
        Uri.parse('$baseUrl/post/$id'),
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

  static Future<Post> addNewPost(Post post, String userId) async{
    Map<String,dynamic> _jsonPost = post.toJson();
    _jsonPost.removeWhere((key, value) => value == null);
    _jsonPost['owner'] = userId;

    //se sono qui, lo userId non è nullo perché non si è interrota la funzione a riga 62
    final http.Response response = await http.post(
        Uri.parse('$baseUrl/post/create'),
        headers: {
          'app-id': '626eebd60787bf09ba5c2b33',
          'Content-Type': 'application/json'
        },
        body: jsonEncode(_jsonPost)
    );

    if(response.statusCode == 200){
      return Post.fromJson(jsonDecode(response.body));
    }

    throw Exception('Post non inserito: ${response.body}');
  }

  static Future<Post> editPost(Post post, String userId) async{
    Map<String,dynamic> _jsonPost = post.toJson();
    _jsonPost.removeWhere((key, value) => value == null);
    _jsonPost['owner'] = userId;
    _jsonPost.removeWhere((key, value) => key == 'id');

    if(post.id == null){
      throw Exception('Id del post necessario e non trovato');
    }

    final http.Response response = await http.put(
        Uri.parse('$baseUrl/post/${post.id}'),
        headers: {
          'app-id': '626eebd60787bf09ba5c2b33',
          'Content-Type': 'application/json'
        },
        body: jsonEncode(_jsonPost)
    );

    if(response.statusCode == 200){
      return Post.fromJson(jsonDecode(response.body));
    }

    throw Exception('Post non modificato: ${response.body}');
  }
}
