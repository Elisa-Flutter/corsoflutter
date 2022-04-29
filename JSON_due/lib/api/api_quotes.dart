import 'dart:convert';

import 'package:json_due/models/quotes_response.dart';
import 'package:http/http.dart' as http;

class ApiQuotes{
  static Future<QuotesResponse> getQuotesFromInternet() async{
    /*metodi per interrogare un url:
      -GET: ottenere una risposta (<- es: entrate su ig per vedere il feed)
      -POST: creare un nuovo elemento (<- es: creazione di un nuovo post)
      -PUT/PATCH: modificare un elemento (<- es: modificare un post)
      -DELETE: eliminazione di un elemento (<- es: eliminazione di un post)
    */

    /* STATUS CODE:
    200: OK
    301: unauthorized
    404: non trovata
    500: server error
    */

    final response = await http.get(Uri.parse("https://dummyjson.com/quotes"));

    if(response.statusCode == 200){
      return QuotesResponse.fromJson(jsonDecode(response.body));
    }

    throw Exception('Sorry mi disp: ${response.statusCode} - ${response.reasonPhrase}');
  }

  /*static Future<void> postQuote(Map<String, dynamic> quote) async{
    // http.post('url', body:'...');
  }*/
}