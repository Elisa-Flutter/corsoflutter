import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media/models/post.dart';

class LikeButton extends StatefulWidget {
  final Post post;
  const LikeButton(this.post, {Key? key}) : super(key: key);

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool like = false;
  late int likenum;
  void initsharepref() async {
    SharedPreferences shareprefe = await SharedPreferences.getInstance();
    final _like = shareprefe.getStringList("preferiti") ?? [];
    setState(() {
      like = _like.contains(widget.post.id);
      if (like) {
        likenum++;
      }
    });
  }

  void aggiungipreferiti() async {
    SharedPreferences shareprefe = await SharedPreferences.getInstance();
    var _newlike = shareprefe.getStringList("preferiti") ?? [];
    _newlike.add(widget.post.id!);
    await shareprefe.setStringList("preferiti", _newlike);
  }

  void rimuovipreferiti() async {
    SharedPreferences shareprefe = await SharedPreferences.getInstance();
    var _like = shareprefe.getStringList("preferiti") ?? [];
    _like.remove(widget.post.id);
    await shareprefe.setStringList("preferiti", _like);
  }

  @override
  void initState() {
    likenum = widget.post.likes ?? 0;

    initsharepref();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: () {
          like == false ? aggiungipreferiti() : rimuovipreferiti();
          setState(() {
            like = !like;
            if (like) {
              likenum++;
            } else {
              likenum--;
            }
          });
        },
        icon: Icon(like ? Icons.favorite : Icons.favorite_outline),
        label: Text(likenum.toString()));
  }
}
