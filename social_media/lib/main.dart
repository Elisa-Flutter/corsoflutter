import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:social_media/routes.dart';

void main() {
  initializeDateFormatting('it_IT', null).then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: routes(),
    );
  }
}
