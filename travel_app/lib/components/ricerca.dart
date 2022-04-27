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
            onPressed: () {
              if(amIOnHomepage){
                //andare alla pagina di ricerca + aprire il drawer
                Navigator.of(context).pushNamed('/search', arguments: {'openDrawer': true});
              } else {
                if(Scaffold.of(context).hasEndDrawer){
                  Scaffold.of(context).openEndDrawer();
                }
              }

              /*if(amIOnHomepage){
                Navigator.of(context).pushNamed('/search', arguments: [{'filterOpen': true}]);
              } else{
                if(Scaffold.of(context).hasEndDrawer){
                  Scaffold.of(context).openEndDrawer();
                }
              }*/

            },
            icon: const Icon(Icons.filter_list))
      ],
    );
  }
}
