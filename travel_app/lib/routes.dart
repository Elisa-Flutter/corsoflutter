import 'package:flutter/material.dart';
import 'package:travel_app/pages/home.dart';

generateRoutes() {
  return {
    '/' : (context) => const Home(),
    '/profile' : (context) => const Center(child: Text('Profilo')),
    '/details': (context) => const Center(child: Text('Details')),
    '/favorites' : (context) => const Center(child: Text('Preferiti')),
    '/mete' : (context) => const Center(child: Text('Mete')),
  };
}