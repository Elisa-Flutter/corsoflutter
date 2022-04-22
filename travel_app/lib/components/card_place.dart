import 'package:flutter/material.dart';
import 'package:travel_app/models/meta_turistica.dart';
import 'package:travel_app/pages/dettaglio_meta.dart';

class CardPlace extends StatelessWidget {
  final MetaTuristica meta;
  const CardPlace(this.meta, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => DettaglioMeta(meta)
          )
        ),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 3/2,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(meta.imageUrl),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(meta.city, style: TextStyle(fontSize: 16),),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.pin_drop, color: Colors.blue, size: 12,),
                      Text(meta.country, style: const TextStyle(color: Colors.blue, fontSize: 12)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
