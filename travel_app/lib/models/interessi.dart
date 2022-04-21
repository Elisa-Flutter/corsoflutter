import 'package:flutter/material.dart';

enum Interessi{
  mare,
  montagna,
  lago,
  piscina,
  bosco,
  spa
}

extension StringaExtension on String{
  String get prova{
    return "prova";
  }
}

extension InteressiExtension on Interessi{

  IconData get icon {
    switch(this){
      case Interessi.mare:
        return Icons.android;
      case Interessi.montagna:
        return Icons.style;
      case Interessi.lago:
        return Icons.circle;
      case Interessi.piscina:
        return Icons.local_cafe;
      case Interessi.bosco:
        return Icons.ac_unit_rounded;
      case Interessi.spa:
        return Icons.person;
    }
  }
}