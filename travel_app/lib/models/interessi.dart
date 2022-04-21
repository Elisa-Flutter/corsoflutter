import 'package:flutter/material.dart';

enum Interessi{
  mare,
  montagna,
  lago,
  piscina,
  bosco,
  spa
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

  Color get color {
    switch(this){
      case Interessi.mare:
        return Colors.blue;
      case Interessi.montagna:
        return Colors.green;
      case Interessi.lago:
        return Colors.teal;
      case Interessi.piscina:
        return Colors.yellow;
      case Interessi.bosco:
        return Colors.brown;
      case Interessi.spa:
        return Colors.deepPurple;
    }
  }
}