import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media/api/api_post.dart';
import 'package:social_media/models/post.dart';
import 'package:social_media/models/user.dart';

class LikeButton extends StatefulWidget {
  final Post post;
  final String userIdLoggato;
  const LikeButton(this.post, this.userIdLoggato, {Key? key}) : super(key: key);

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool _conLike = false;
  late int _numLikes;
  late List<String> _listaLikes;
  late SharedPreferences _sp;

  initLike()async{
    final sp = await SharedPreferences.getInstance();
    //lista dei post a cui ha messo like l'utente loggato
    final listaLike = sp.getStringList('like_${widget.userIdLoggato}') ?? [];
    setState(() {
      _conLike = listaLike.contains(widget.post.id);
      _listaLikes = listaLike;
      _sp = sp;
    });
  }

  void togglePrefreriti() async {
    _conLike
        ? _listaLikes.remove(widget.post.id!)
        : _listaLikes.add(widget.post.id!);

    await _sp.setStringList('like_${widget.userIdLoggato}', _listaLikes);

    _conLike
        ? _numLikes--
        : _numLikes++;

    await ApiPost.editPost(
        Post(
            id: widget.post.id,
            likes: _numLikes,
            owner: const User(firstName: 'Elisa', lastName: 'Cattaneo')),
        widget.userIdLoggato
    );

    setState(() {
      _conLike = !_conLike;
    });
  }

  @override
  void initState() {
    _numLikes = widget.post.likes ?? 0;
    initLike();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: togglePrefreriti,
        icon: Icon(_conLike ? Icons.favorite : Icons.favorite_outline),
        label: Text(_numLikes.toString()));
  }
}
