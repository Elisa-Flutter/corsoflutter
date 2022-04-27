import 'package:flutter/material.dart';
import 'package:travel_app/components/categorie.dart';
import 'package:travel_app/components/popular_place.dart';
import 'package:travel_app/components/recommended.dart';
import 'package:travel_app/components/ricerca.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black87),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              Icons.pin_drop,
              color: Colors.blue,
            ),
            Text(
              'Italia',
              style: TextStyle(
                  color: Colors.blue,

              ),
            )
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundColor: Colors.yellow,
              child: Text('EC'),
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Preferiti'),
              onTap: () => Navigator.of(context).popAndPushNamed('/favorites'),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: ListView(
          children: const [
            Categorie(),
            SizedBox(height: 24),
            Ricerca(amIOnHomepage: true,),
            PopularPlace(height: 170),
            Recommended(height: 170)
          ],
        ),
      ),
    );
  }
}
