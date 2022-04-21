import 'package:flutter/material.dart';
import 'package:travel_app/components/card_place.dart';
import 'package:travel_app/components/titolo.dart';
import 'package:travel_app/models/meta_turistica.dart';

class PopularPlace extends StatelessWidget {
  final double height;
  const PopularPlace({this.height = 150, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Titolo('Popular Place'),
        SizedBox(
          height: height,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: MetaTuristica.listaMete.length,
              itemBuilder: (context, index) {
                if(MetaTuristica.listaMete[index].rating >= 5){
                  return CardPlace(
                      imageUrl: MetaTuristica.listaMete[index].imageUrl,
                      city: MetaTuristica.listaMete[index].city,
                      country: MetaTuristica.listaMete[index].country
                  );
                }
                return const SizedBox(width: 0);
              }
          ),
        )
      ],
    );
  }
}
