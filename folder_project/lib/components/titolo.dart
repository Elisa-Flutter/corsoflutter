import 'package:flutter/material.dart';

class Titolo extends StatelessWidget {
  final String title;
  const Titolo({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(title, style: const TextStyle(fontSize: 20, color: Colors.black54),),
    );
  }
}
