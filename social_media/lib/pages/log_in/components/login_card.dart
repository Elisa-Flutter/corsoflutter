import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/user.dart';
import '../../home_page/home.dart';

class LogInCard extends StatelessWidget {
  final User user;
  const LogInCard(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        SharedPreferences sp = await SharedPreferences.getInstance();

        sp.setString('logKey', user.id!);

        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return const Home();
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: CircleAvatar(
          backgroundColor: Colors.blue,
          radius: 70,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 8,
              ),
              CircleAvatar(
                radius: 40,
                backgroundImage:
                user.picture != null ? NetworkImage(user.picture!) : null,
              ),
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    user.firstName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
