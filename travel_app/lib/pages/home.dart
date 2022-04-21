import 'package:flutter/material.dart';
import 'package:travel_app/models/interessi.dart';
import 'package:travel_app/models/meta_turistica.dart';

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
              style: TextStyle(color: Colors.blue),
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
      drawer: Drawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Category'),
                SizedBox(
                  height: 80,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: Interessi.values
                        .map((interesse) => Container(
                              padding: EdgeInsets.all(8),
                              margin: EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black54),
                                  borderRadius: BorderRadius.circular(16)),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: interesse.color,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Icon(interesse.icon),
                                  ),
                                  Text(interesse.name)
                                ],
                              ),
                            ))
                        .toList(), //List<Icon>[Icon(Icons.android), Icon(Icons.tent)...]
                  ),
                )
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Expanded(
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
            ),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: MetaTuristica.listaMete
                    .where((meta) => meta.raccomanded == true)
                    .toList()
                    .map(
                      (meta) => AspectRatio(
                        aspectRatio: 1,
                        child: Card(
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(meta.imageUrl),
                                      fit: BoxFit.cover,
                                    ),
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                              Text(meta.city),
                              Text(meta.country)
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
