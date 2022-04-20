import 'package:flutter/material.dart';
import 'package:ig_giuseppe/components/storia.dart';


class StoriesList extends StatelessWidget {
  final List<String> labelList;
  const StoriesList({Key? key, required this.labelList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: SizedBox(
        width: MediaQuery.of(context).size.width, //Larghezza schermo
        height: 110,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: labelList.map((label) => Storia(storyLabel: label)).toList(),
          //children: List.generate(10, (index) => const Storia())),
        ),
      ),
    );
  }
}
