import 'package:flutter/material.dart';
import 'package:travel_app/components/card_category.dart';
import 'package:travel_app/components/titolo.dart';
import 'package:travel_app/models/interessi.dart';

class Categorie extends StatefulWidget {
  final List<Interessi>? interessiAttivi;
  const Categorie({this.interessiAttivi, Key? key}) : super(key: key);

  @override
  State<Categorie> createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {
  List<Interessi>? _interessiAttivi;
  @override
  void initState() {
    super.initState();
    _interessiAttivi = widget.interessiAttivi;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Titolo('Category'),
        SizedBox(
          height: 80,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Interessi.values.length,
              itemBuilder: (context, index) {
                if(index == 0){
                  return Row(
                    children: [
                       CardCategory(
                        null,
                        color: Colors.red,
                        icon: Icons.spa,
                        text: 'all',
                        selezionata: _interessiAttivi == null,
                      ),
                      CardCategory(
                        Interessi.values[index],
                        selezionata: (_interessiAttivi?.contains(Interessi.values[index]) ?? false),
                        marginRight: index != (Interessi.values.length -1),
                      )
                    ],
                  );
                }
                return CardCategory(
                  Interessi.values[index],
                  selezionata: (_interessiAttivi?.contains(Interessi.values[index]) ?? false),
                  marginRight: index != (Interessi.values.length -1),
                );
              }
          ),

          /* ListView(
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
                  ),*/


        )
      ],
    );
  }
}
