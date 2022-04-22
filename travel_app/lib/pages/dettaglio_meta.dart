import 'package:flutter/material.dart';
import 'package:travel_app/components/titolo.dart';
import 'package:travel_app/models/meta_turistica.dart';

class DettaglioMeta extends StatelessWidget {
  final MetaTuristica meta;
  const DettaglioMeta(this.meta, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(meta.imageUrl),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16),
                        topLeft: Radius.circular(16),
                      )),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Card(
                  child: Container(
                    width: 250,
                    height: 120,
                    padding: const EdgeInsets.only(top: 5, bottom: 15, left: 20, right: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white38, width: 1)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Titolo(meta.city),
                            Row(
                              children: [
                                const Icon(
                                  Icons.place_outlined,
                                  color: Colors.blue,
                                ),
                                Text(
                                  meta.country,
                                  style: const TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.date_range_outlined,
                                  color: Colors.green.shade800,
                                ),
                                const Text(
                                  '3 Days',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow.shade900,
                            ),
                            Text(meta.rating.toString()),
                            Icon(
                              Icons.schedule_outlined,
                              color: Colors.purple.shade800,
                            ),
                            const Text('12:00')
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            color: Colors.blue,
          ),Container(
            height: 50,
            color: Colors.green,
          ),Container(
            height: 50,
            color: Colors.blue,
          ),Container(
            height: 50,
            color: Colors.green,
          ),Container(
            height: 50,
            color: Colors.blue,
          ),Container(
            height: 50,
            color: Colors.green,
          ),Container(
            height: 50,
            color: Colors.blue,
          ),Container(
            height: 50,
            color: Colors.green,
          ),Container(
            height: 50,
            color: Colors.blue,
          ),Container(
            height: 50,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
