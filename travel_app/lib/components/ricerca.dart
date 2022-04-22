import 'package:flutter/material.dart';

class Ricerca extends StatelessWidget {
  final bool shouldGoToSearchPage;
  const Ricerca({this.shouldGoToSearchPage = false, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextField(
              onTap: shouldGoToSearchPage ? () {
                FocusScope.of(context).unfocus();
                Navigator.of(context).pushNamed('/search');
              } : null,
              readOnly: true,
              decoration: const InputDecoration(
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
