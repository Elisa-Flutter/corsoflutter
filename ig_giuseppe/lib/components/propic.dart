import 'package:flutter/material.dart';

class Propic extends StatelessWidget {
  const Propic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [Colors.purple, Colors.amber],
        ),
      ),
      child: Center(
        child: Container(
          width: 76,
          height: 76,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [Colors.pinkAccent, Colors.purpleAccent],
            ),
            border: Border.all(color: Colors.white, width: 2),
          ),
        ),
      ),
    );
  }
}
