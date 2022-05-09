import 'package:flutter/material.dart';
import 'package:social_media/components/card_post.dart';
import 'package:social_media/pages/Post_page/components/lista_commenti.dart';

import '../../../models/post.dart';

class BodyPagePost extends StatelessWidget {
  final Post post;
  final VoidCallback inizializzaVariabili;
  final String userId;
  const BodyPagePost(this.post, this.inizializzaVariabili, {required this.userId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        CardPost(userId, post: post, callback: inizializzaVariabili,),
        ListaCommenti(post.id!),
      ],
    );
  }
}
