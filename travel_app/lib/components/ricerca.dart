import 'package:flutter/material.dart';

class Ricerca extends StatelessWidget {
  const Ricerca({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.search),
                  hintText: 'Search'),
            )),
        IconButton(
            onPressed: () => print('filtra'),
            icon: const Icon(Icons.filter_list))
      ],
    );
  }
}
