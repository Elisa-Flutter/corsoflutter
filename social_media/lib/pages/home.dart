import 'package:flutter/material.dart';
import 'package:social_media/api/api_user.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:  [
          const CircleAvatar(
            radius: 60,
            backgroundColor: Colors.pink,
          ),
          Text('App Social :D',
              style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 40))
        ],
      ),
    );
  }
}
