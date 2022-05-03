import 'package:flutter/material.dart';
import 'package:social_media/pages/home.dart';

generateRoutes() {
  return {
    '/' : (context) => const Home(),
    '/profile' : (context) => const Center(child: Text('Profilo')),
  };
}