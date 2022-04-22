import 'package:flutter/material.dart';

class Ricerca extends StatelessWidget {
  final bool amIOnHomepage;
  final Function(String)? callback;
  const Ricerca({this.amIOnHomepage = false, this.callback, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextField(
              onTap: amIOnHomepage
                  ?  () {
                        FocusScope.of(context).unfocus();
                        Navigator.of(context).pushNamed('/search');
                      }
                  : null,
              onChanged: callback,
              readOnly: amIOnHomepage,
              autofocus: !amIOnHomepage,
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
