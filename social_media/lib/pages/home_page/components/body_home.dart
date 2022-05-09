import 'package:flutter/material.dart';

import '../../../api/api_post.dart';
import '../../../components/card_post.dart';
import '../../../models/post.dart';
import '../../../models/post_response.dart';

class BodyHome extends StatefulWidget {
  final String? iduser;
  final bool profilo;
  const BodyHome({this.iduser, this.profilo = false, Key? key})
      : super(key: key);

  @override
  State<BodyHome> createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  late List<Post> _listPost;
  late Future<List<Post>> _future;
  late int _skipPost;
  late bool _hasMorePost;
  late int _page;

  @override
  void initState() {
    super.initState();
    inizializzaVariabili();
  }

  Future<List<Post>> _fetchPost() async {
    late PostResponse result;
    if (widget.iduser != null) {
      result = await ApiPost.getPostListByUser(widget.iduser!);
    } else {
      result = await ApiPost.getPostList(page: _page);
    }

    setState(() {
      _skipPost = _skipPost + result.limit;
      _hasMorePost = (result.total - _skipPost) > 0;
      _listPost = _listPost + result.data;
      _page++;
    });

    return _listPost;
  }

  void inizializzaVariabili() {
    _listPost = [];
    _hasMorePost = false;
    _skipPost = 0;
    _page = 0;

    _future = _fetchPost();
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
            if (snapshot.hasData && snapshot.data is List<Post>) {
              final listPost = (snapshot.data as List<Post>);
              return ListView.builder(
                  itemCount: listPost.length,
                  itemBuilder: (context, index) {
                    if (index == _listPost.length - 1 && _hasMorePost) {
                      _future = _fetchPost();

                      return Column(
                        children: [
                          CardPost(post: listPost[index], callback: inizializzaVariabili,),
                          if (index < _listPost.length)
                            const CircularProgressIndicator(),
                        ],
                      );
                    }
                    return CardPost(
                      post: listPost[index],
                      profilo: widget.profilo,
                      callback: inizializzaVariabili,
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
