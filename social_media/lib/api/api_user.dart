import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:social_media/models/user.dart';
import 'package:social_media/models/user_response.dart';

class ApiUser{
  static String get baseUrl => 'https://dummyapi.io/data/v1';

  static Future<UserResponse> getUserList({int page = 0, int limit = 20}) async{

    final http.Response response = await http.get(
        Uri.parse('$baseUrl/user?page=$page&limit=$limit'),
        headers: {
          'app-id': '626eebd60787bf09ba5c2b33'
        }
    );

    if(response.statusCode == 200){
      return UserResponse.fromJson(jsonDecode(response.body));
    }

    throw Exception('Errore in ricevere gli utenti: ${response.body}');
  }

  static Future<User> getDetailsFor(String id) async{
    final http.Response response = await http.get(
        Uri.parse('$baseUrl/user/$id'),
        headers: {
          'app-id': '626eebd60787bf09ba5c2b33'
        }
    );

    if(response.statusCode == 200){
      return User.fromJson(jsonDecode(response.body));
    }

    throw Exception('Errore in ricevere i dettagli dell\'utente: ${response.body}');
  }

}

/*
class ApiUser{
  static String get baseUrl => 'https://dummyapi.io/data/v1';
  
  static getUserList() async{

    final response = await http.get(Uri.parse('$baseUrl/user'),
        headers: {
        "app-id": "626eebd60787bf09ba5c2b33"
    });

    print(response.body);
  }
}*/
