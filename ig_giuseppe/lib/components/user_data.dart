import 'package:flutter/material.dart';

class UserData extends StatelessWidget {
  final String dataNumber;
  final String dataLabel;
  const UserData({
    Key? key,
    required this.dataNumber,
    required this.dataLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          dataNumber,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        Text(
          dataLabel,
          style: const TextStyle(fontSize: 12),
        )
      ],
    );
  }
}
