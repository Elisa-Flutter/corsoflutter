import 'package:flutter/material.dart';

class CardCategory extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;

  final bool marginRight;
  const CardCategory({required this.color, required this.icon, required this.text, this.marginRight = true, Key? key}) : super(key: key);

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
                color: color,
                borderRadius:
                BorderRadius.circular(16)),
            child: Icon(icon),
          ),
          Text(text)
        ],
      ),
    );
  }
}
