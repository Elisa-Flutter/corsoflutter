import 'package:flutter/material.dart';
import 'package:social_media/pages/home.dart';
import 'package:social_media/pages/login.dart';

generateRoutes() {
  return {
    '/' : (context) => const Login(),
    '/profile' : (context) => WillPopScope(onWillPop: () {
      Navigator.of(context).pop(true);
      return Future.value(true);},child: const Center(child: Text('Profilo'))),
    '/home' : (context) => const Home(),
  };
}