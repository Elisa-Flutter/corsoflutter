import 'dart:convert';

import 'package:first_json/models/quotes_response.dart';
import 'package:http/http.dart' as http;

class ApiQuotes{
  static quoteResponseFromInternet({int skip = 0}) async{
    final response = await http.get(Uri.parse('https://dummyjson.com/quotes?skip=$skip'));

    if(response.statusCode == 200){
      return QuotesResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception('Errore in quoteResponseFromInternet: ${response.statusCode} - ${response.reasonPhrase}');
  }
}