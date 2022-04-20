import 'package:flutter/material.dart';

class Storia extends StatelessWidget {
  final String storyLabel;
  const Storia({Key? key, required this.storyLabel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column( //Stories
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
            ),
            child: Center(
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Colors.pinkAccent, Colors.purpleAccent],
                  ),
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            ),
          ),
          Text(storyLabel),
        ],
      ),
    );
  }
}
