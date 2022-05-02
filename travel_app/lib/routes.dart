import 'package:flutter/material.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';
import 'package:travel_app/pages/home.dart';
import 'package:travel_app/pages/login_page.dart';
import 'package:travel_app/pages/preferiti_page.dart';
import 'package:travel_app/pages/ricerca_page.dart';

generateRoutes(StreamingSharedPreferences sp) {
  return {
    '/' : (context) => const Home(),
    '/home' : (context) => const Home(),
    '/profile' : (context) => const Center(child: Text('Profilo')),
    '/favorites' : (context) => PreferitiPage(sp),
    '/search' : (context) => const RicercaPage(),
  };
}