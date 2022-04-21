import 'package:flutter/material.dart';
import 'package:travel_app/components/card_place.dart';
import 'package:travel_app/components/titolo.dart';
import 'package:travel_app/models/meta_turistica.dart';

class Recommended extends StatelessWidget {
  final double height;
  const Recommended({this.height = 150, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Titolo('Recommended'),
        SizedBox(
          height: height,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children:
            MetaTuristica.listaMete.where((meta) => meta.raccomanded /*== true*/)
                .map((metaRaccomanta) =>
                CardPlace(
                    imageUrl: metaRaccomanta.imageUrl,
                    city: metaRaccomanta.city,
                    country: metaRaccomanta.country)
            ).toList(),
          ),
        )
      ],
    );
  }
}
