import 'package:flutter/material.dart';
import 'package:travel_app/pages/home.dart';
import 'package:travel_app/pages/login_page.dart';
import 'package:travel_app/pages/ricerca_page.dart';

generateRoutes() {
  return {
    '/' : (context) => LoginPage(),
    '/home' : (context) => const Home(),
    '/profile' : (context) => const Center(child: Text('Profilo')),
    '/favorites' : (context) => const Center(child: Text('Preferiti')),
    '/search' : (context) => const RicercaPage(),
  };
}