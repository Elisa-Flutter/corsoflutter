import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media/pages/profilo/profilo.dart';

class CustomAppBAr extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBAr({Key? key}) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(60);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
            onPressed: () async {
              SharedPreferences sp = await SharedPreferences.getInstance();
              var iduser = sp.getString('logKey');
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Profilo(iduser ?? "user not found");
              }));
            },
            icon: const Icon(Icons.person))
      ],
    );
  }
}
