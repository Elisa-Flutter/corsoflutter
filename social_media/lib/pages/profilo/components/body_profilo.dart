import 'package:flutter/material.dart';
import 'package:social_media/pages/home_page/components/body_home.dart';
import 'package:social_media/pages/profilo/components/list_dettagli_profilo.dart';

import '../../../models/user.dart';

class BodyProfilo extends StatelessWidget {
  final Future<User> future;
  const BodyProfilo(this.future, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        final user = (snapshot.data as User);

        return SizedBox(
          child: Column(
            children: [
              Center(
                  child: Container(
                padding: const EdgeInsets.only(bottom: 10),
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(100),
                        bottomRight: Radius.circular(100))),
                width: MediaQuery.of(context).size.width,
                child: CircleAvatar(
                  radius: 80,
                  child: CircleAvatar(
                      radius: 74,
                      backgroundImage:
                      user.picture != null ? NetworkImage(user.picture!) : null),
                ),
              )),
              const SizedBox(
                height: 5,
              ),
              const Divider(),
              ListProfDett(user),
              const Divider(),
              if(user.id != null) Expanded(
                  child: BodyHome(
                user.id!,
                profilo: true,
              )),
            ],
          ),
        );
      },
    );
  }
}
