import 'package:flutter/material.dart';
import 'package:travel_app/models/interessi.dart';

class CardCategory extends StatelessWidget {
  final Interessi? interesse;
  final bool marginRight;

  //opzionali
  final Color? color;
  final IconData? icon;
  final String? text;

  const CardCategory(this.interesse, {this.color, this.icon, this.text, this.marginRight = true, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: marginRight ? EdgeInsets.only(right: 8) : null,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black54),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: interesse?.color ?? color,
                borderRadius:
                BorderRadius.circular(16)),
            child: Icon(interesse?.icon ?? icon),
          ),
          Text(interesse?.name ?? text ?? '')
        ],
      ),
    );
  }
}
