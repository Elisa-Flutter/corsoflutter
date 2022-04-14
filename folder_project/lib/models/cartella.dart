import 'package:flutter/material.dart';

class Cartella{
  final IconData iconData;
  final String title;
  final int numTasks;

  const Cartella({
    required this.iconData,
    required this.title,
    this.numTasks = 0});
}