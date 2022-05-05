import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:social_media/api/api_user.dart';
import 'package:social_media/routes.dart';

void main() async{
  initializeDateFormatting('it_IT', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Media App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
         // bodyText2: GoogleFonts.areYouSerious().copyWith(fontSize: 24)
        )
      ),
      initialRoute: '/',
      routes: generateRoutes(),
    );
  }
}