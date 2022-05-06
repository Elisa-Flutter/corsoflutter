import 'package:flutter/material.dart';
import 'package:social_media/api/api_comment.dart';
import 'package:social_media/models/comment.dart';
import 'package:social_media/models/comment_response.dart';
import 'package:social_media/pages/Post_page/components/card_comment.dart';

class ListaCommenti extends StatefulWidget {
  final String idPost;
  const ListaCommenti(this.idPost, {Key? key}) : super(key: key);

  @override
  State<ListaCommenti> createState() => _ListaCommentiState();
}

class _ListaCommentiState extends State<ListaCommenti> {
  late List<Comment> _listComment;
  late Future<List<Comment>> _future;
  late int _skipComment;
  late bool _hasMoreComment;

  Future<List<Comment>> _fetchComment() async {
    CommentResponse result = await ApiComment.getCommentForPost(widget.idPost);

    setState(() {
      _skipComment = _skipComment + result.limit;
      _hasMoreComment = (result.total - _skipComment) > 0;
      _listComment = _listComment + result.data;
    });

    return _listComment;
  }

  void inizializzaVariabili() {
    _listComment = [];
    _hasMoreComment = false;
    _skipComment = 0;

    _future = _fetchComment();
  }

  @override
  void initState() {
    super.initState();
    inizializzaVariabili();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        setState(() {
          inizializzaVariabili();
        });
        return Future.value();
      },
      child: FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data is List<Comment>) {
              final listComment = (snapshot.data as List<Comment>);
              return ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: listComment.length,
                  itemBuilder: (context, index) {
                    if (index == _listComment.length - 1 && _hasMoreComment) {
                      _future = _fetchComment();

                      return Column(
                        children: [
                          CardComment(listComment[index]),
                          if (index < _listComment.length)
                            const CircularProgressIndicator(),
                        ],
                      );
                    }
                    return CardComment(
                      listComment[index],
                    );
                  });
            }
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
