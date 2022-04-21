import 'package:flutter/material.dart';
import 'package:travel_app/models/interessi.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black87
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.pin_drop, color: Colors.blue,),
            Text('Italia', style: TextStyle(color: Colors.blue),)
          ],
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.yellow,
            child: Text('EC'),
          )
        ],
      ),
      drawer: Drawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Category'),
                Row(
                  children: <Widget>[Text('All ')] +
                      Interessi.values.map(
                          (interesse) => Icon(interesse.icon)
                  ).toList(), //List<Icon>[Icon(Icons.android), Icon(Icons.tent)...]
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}