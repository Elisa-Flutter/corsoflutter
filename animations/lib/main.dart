import 'package:animations/pages/homepage.dart';
import 'package:animations/pages/tween_builder.dart';
import 'package:animations/pages/tween_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TweenPage(),
    );
  }
}