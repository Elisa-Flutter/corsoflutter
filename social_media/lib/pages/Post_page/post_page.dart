import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media/api/api_comment.dart';

import '../../models/post.dart';
import 'components/body_page_post.dart';

class PostPage extends StatefulWidget {
  final Post post;
  const PostPage(this.post, {Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  late TextEditingController _textEditingController;
  String? _message;
  late String? _idUtente;
  late String _idPost;
  late UniqueKey _key;

  Future<void> _initIdUtente() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    _idUtente = sp.getString('loggedUser');
    if (_idUtente == null) {
      throw Exception('Utente non loggato');
    }
  }

  @override
  void initState() {
    super.initState();
    _key = UniqueKey();
    _initIdUtente();
    _textEditingController = TextEditingController();
    _idPost = widget.post.id!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
           var popResult = await showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return Padding(
                      padding: EdgeInsets.only(
                          top: 8.0,
                          left: 8.0,
                          right: 8.0,
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        const Text('Inserisci il tuo commento'),
                        TextField(
                          controller: _textEditingController,
                          maxLines: 5,
                          onChanged: (value) {
                            _message = _textEditingController.text;
                          },
                        ),
                        Row(children: [
                          TextButton(
                              child: const Text('Annulla'),
                              onPressed: () {
                                _message = null;
                                _textEditingController.clear();
                                Navigator.of(context).pop();
                              }),
                          TextButton(
                              child: const Text('Pubblica'),
                              onPressed: () async {
                                if (_message == null || _message!.isEmpty) {
                                  Navigator.of(context).pop(); //O ALERT DIALOG IN CUI SI AVVISA L'UTENTE
                                }

                                await ApiComment.addCommentTo(_idPost, _message!);

                                _message = null;
                                _textEditingController.clear();
                                Navigator.of(context).pop(true);
                              })
                        ])
                      ]));
                });
           if(popResult == true){
             setState(() {
               _key = UniqueKey();
             });
           }
          }),
      body: BodyPagePost(widget.post),
    );
  }
}
