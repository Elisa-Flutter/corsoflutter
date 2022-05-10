import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media/models/comment.dart';
import 'package:social_media/models/comment_response.dart';

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

  //modo "manuale"
  static Future<Comment> addCommentTo(String postId, String message) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? userId = sp.getString('loggedUser');

    if(userId == null){
      throw Exception('Impossibile insere un commento, per favore fai il login');
    }
    //se sono qui, lo userId non è nullo perché non si è interrota la funzione a riga 62
    final http.Response response = await http.post(
        Uri.parse('$baseUrl/comment/create'),
        headers: {
          'app-id': '626eebd60787bf09ba5c2b33',
          'Content-Type': 'application/json'
        },
        body: jsonEncode({
          'owner': '60d0fe4f5311236168a109ca',
          'post': postId,
          'message': message
        })
    );

    if(response.statusCode == 200){
      return Comment.fromJson(jsonDecode(response.body));
    }

    throw Exception('Commento non inserito: ${response.body}');
  }

  //modo "automatico"
  static Future<Comment> addCommentToViaComment(Comment comment) async{
    Map<String,dynamic> _jsonComment = comment.toJson();
    _jsonComment.removeWhere((key, value) => value == null);

    //se sono qui, lo userId non è nullo perché non si è interrota la funzione a riga 62
    final http.Response response = await http.post(
        Uri.parse('$baseUrl/comment/create'),
        headers: {
          'app-id': '626eebd60787bf09ba5c2b33',
          'Content-Type': 'application/json'
        },
        body: jsonEncode({_jsonComment})
    );

    if(response.statusCode == 200){
      return Comment.fromJson(jsonDecode(response.body));
    }

    throw Exception('Commento non inserito: ${response.body}');
  }

  static Future<bool> deleteCommentId(String commentId) async{
    final http.Response response = await http.delete(
        Uri.parse('$baseUrl/comment/$commentId'),
        headers: {
          'app-id': '626eebd60787bf09ba5c2b33'
        }
    );

    if(response.statusCode == 200){
      return true;
    }

    throw Exception('Errore nell\'eliminazione del commento: ${response.body}');
  }
}
