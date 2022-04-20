import 'package:flutter/material.dart';

class Bio extends StatelessWidget {
  final String name;
  final String profession;
  final String biography;
  final String link;
  const Bio(
      {Key? key,
      required this.name,
      required this.profession,
      required this.biography,
      required this.link})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      //Bio
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        Text(
          profession,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        Text(
          biography,
          style: const TextStyle(fontSize: 14),
        ),
        Text(
          link,
          style: const TextStyle(fontSize: 14, color: Colors.blue),
        ),
        //const Text('Followed by: ', style: TextStyle(fontSize: 14),),
        RichText(
          text: const TextSpan(
            text: 'Followed by ',
            style: TextStyle(fontSize: 14, color: Colors.black),
            children: [
              TextSpan(
                  text: 'username1, username2 and 2 others',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black))
            ],
          ),
        )
      ],
    );
  }
}
