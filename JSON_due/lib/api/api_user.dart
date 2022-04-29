import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:json_due/models/user_response.dart';

class ApiUser{
  static Future<UserResponse> getUserFromInternet() async{

    final response = await http.get(Uri.parse("https://dummyjson.com/users"));

    if (response.statusCode == 200){
      return UserResponse.fromJson(jsonDecode(response.body));
    }

    throw Exception('Errore in getUserFromInternet: ${response.statusCode} - ${response.reasonPhrase}');
  }
}