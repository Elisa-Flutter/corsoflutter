import 'package:flutter/material.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';
import 'package:travel_app/components/place_main_card.dart';
import 'package:travel_app/components/titolo.dart';
import 'package:travel_app/models/meta_turistica.dart';

class DettaglioMeta extends StatefulWidget {
  final MetaTuristica meta;
  const DettaglioMeta(this.meta, {Key? key}) : super(key: key);

  @override
  State<DettaglioMeta> createState() => _DettaglioMetaState();
}

class _DettaglioMetaState extends State<DettaglioMeta> {
  bool isFave = false;

  initSP() async {
    final sp = await StreamingSharedPreferences.instance;
    final faves = sp.getStringList("faves", defaultValue: []).getValue();
    setState(() {
      isFave = faves.contains(widget.meta.city);
    });
  }

  changeSP() async{
    final sp = await StreamingSharedPreferences.instance;
    var faves = sp.getStringList("faves", defaultValue: []).getValue();
    if(isFave){
      faves.remove(widget.meta.city);
    }
    else{
      faves.add(widget.meta.city);
    }
    sp.setStringList("faves", faves);

    setState(() {
      isFave = ! isFave;
    });
  }

  @override
  void initState() {
    super.initState();
    initSP();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(widget.meta.imageUrl), fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //BUTTONS
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.chevron_left,
                        color: Colors.black,
                      )),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: IconButton(
                      onPressed: changeSP,
                      icon: Icon(
                        isFave ? Icons.bookmark : Icons.bookmark_border,
                        color: Colors.black,
                      )),
                ),
              ],
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 100),
                    width: MediaQuery.of(context).size.width,
                    clipBehavior: Clip.hardEdge,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 46),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24)),
                    child: ListView(
                      shrinkWrap: true,
                      //mainAxisSize: MainAxisSize.max,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Titolo("Great Place to visit"),
                        Text(widget.meta.description),

                        const SizedBox(height: 14),

                        const Titolo("Pictures"),
                        SizedBox(
                          height: 100,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: const DecorationImage(
                                        image: NetworkImage(
                                            "https://www.ansa.it/webimages/img_457x/2022/1/11/13f036403c0422c051a142c6214988da.jpg"),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: const DecorationImage(
                                        image: NetworkImage(
                                            "https://www.ansa.it/webimages/img_457x/2022/1/11/13f036403c0422c051a142c6214988da.jpg"),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: const DecorationImage(
                                        image: NetworkImage(
                                            "https://www.ansa.it/webimages/img_457x/2022/1/11/13f036403c0422c051a142c6214988da.jpg"),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: const DecorationImage(
                                        image: NetworkImage(
                                            "https://www.ansa.it/webimages/img_457x/2022/1/11/13f036403c0422c051a142c6214988da.jpg"),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: const DecorationImage(
                                        image: NetworkImage(
                                            "https://www.ansa.it/webimages/img_457x/2022/1/11/13f036403c0422c051a142c6214988da.jpg"),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                              )
                            ],
                          ),
                        ),

                        //MAPPA
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Colors.lightBlueAccent,
                                  borderRadius: BorderRadius.circular(12),
                                  image: const DecorationImage(
                                    image: NetworkImage(
                                        "https://www.ansa.it/webimages/img_457x/2022/1/11/13f036403c0422c051a142c6214988da.jpg"),
                                    fit: BoxFit.cover,
                                  ))),
                        ),

                        //PREZZO + PULSANTE
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "\$ ${widget.meta.minPrice}",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  "Minimum Price",
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 14),
                                )
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () => ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                      content: Text(
                                          "Book failed, this app is not real lmao"))),
                              child: const Text(
                                "Book now",
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(
                                        horizontal: 80)),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: PlaceMainCard(
                        city: widget.meta.city,
                        country: widget.meta.country,
                        rating: widget.meta.rating),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));

    /*Scaffold(
      body: Column(
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
          Expanded(
            child: ListView(
              children: [
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
          )

        ],
      ),
    );*/
  }
}
