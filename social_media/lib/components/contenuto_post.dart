import 'package:flutter/material.dart';
import 'package:social_media/api/api_post.dart';
import 'package:social_media/components/card_post.dart';
import 'package:social_media/models/post.dart';
import 'package:social_media/models/post_response.dart';

class ContenutoPost extends StatefulWidget {
  const ContenutoPost({Key? key}) : super(key: key);

  @override
  _ContenutoPostState createState() => _ContenutoPostState();
}

class _ContenutoPostState extends State<ContenutoPost> {
  late List<Post> _listPost;
  late Future<List<Post>> _future;
  late int _skipPost;
  late bool _hasMorePost;
  late int _page;

  late bool _isExpanded;
  @override
  void initState() {
    super.initState();
    inizializeInitVariables();
    _isExpanded = false;
  }

  Future<List<Post>> _fetchPost() async {
    final PostResponse result = await ApiPost.getPostList(page: _page);

    setState(() {
      _skipPost = _skipPost + result.limit;
      _hasMorePost = (result.total - _skipPost) > 0;
      _listPost = _listPost + result.data;
      _page++;
    });

    return _listPost;
  }

  void inizializeInitVariables() {
    _listPost = [];
    _hasMorePost = false;
    _skipPost = 0;
    _page = 0;
    _future = _fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return
        FutureBuilder(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data is List<Post>) {
                final listPost = (snapshot.data as List<Post>);
                return ListView(
                  children: [
                    ExpansionPanelList(
                      expansionCallback: (_,__){
                        setState(() {
                          _isExpanded = !_isExpanded;
                        });
                      },
                      children: [
                        ExpansionPanel(
                          isExpanded: _isExpanded,
                          headerBuilder: (_,__){
                            return ListTile(title: Text('Titolo'));
                          },
                          body: Column(
                            children: [
                              ListTile(title: Text('Prova'),)
                            ],
                          )
                        )
                      ],
                    ),
                  ],
                );
                /*return ListView.builder(
                    itemCount: listPost.length/* + (_hasMorePost ? 1 : 0)*/,
                    itemBuilder: (context,index){
                      if(index == _listPost.length-1 && _hasMorePost){
                        _future = _fetchPost();
                        return Column(
                          children: [
                            CardPost(post: listPost[index]),
                          //  if(index < _listPost.length-1) CircularProgressIndicator()
                          ],
                        );
                      }
                      else {
                        return CardPost(post: listPost[index]);
                      }
                    });*/
                    /*itemBuilder: (context, index) {
                      if (index == _listPost.length) {
                        _future = _fetchPost();

                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return CardPost(post: listPost[index]);
                    });*/
              }
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            });
  }

/*ListView(
      children: const [
        CardPost(
          post: Post(
            likes: 18,
            link: "link",
            image: "image",
            publishDate: "publishDate",
            id: "263",
            text: "text",
            owner: User(
              id: "id",
              firstName: "Matteo",
              lastName: "Andersen",
              email: "sara@sara.it",
              picture: "https://randomuser.me/api/portraits/med/women/5.jpg",
            ),
          ),
        ),
      ],
    );*/
}