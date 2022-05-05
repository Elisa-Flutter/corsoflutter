import 'package:flutter/material.dart';
import 'package:social_media/api/api_user.dart';
import 'package:social_media/components/card_post.dart';
import 'package:social_media/components/contenuto_post.dart';
import 'package:social_media/models/post.dart';
import 'package:social_media/models/user.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //ApiUser.addUser(User(firstName: 'Elisa', lastName: 'Cattaneo', email: 'elisa.flutter@flutter.it'));
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                "https://04.cadwork.com/wp-content/uploads/logo-facebook.png",
                width: 100,
              ),
              const Divider(
                thickness: 4,
                color: Colors.blue,
              ),
              Expanded(
                child: ContenutoPost()
              ),
            ],
          ),
        ),
      ),
    );
  }
}
