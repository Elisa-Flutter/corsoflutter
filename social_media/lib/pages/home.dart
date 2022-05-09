import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media/api/api_comment.dart';
import 'package:social_media/components/contenuto_post.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController _textEditingController;
  String? _message;
  late String? _idUtente;
  late String _idPost;

  Future<void> _initIdUtente() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    _idUtente = sp.getString('loggedUser');
    if(_idUtente == null){
      throw Exception('Utente non loggato');
    }
  }

  @override
  void initState() {
    super.initState();
    _initIdUtente();
    _textEditingController = TextEditingController();
    _idPost = '60d21b4667d0d8992e610c85';
  }

  @override
  Widget build(BuildContext context) {
    //ApiUser.addUser(User(firstName: 'Elisa', lastName: 'Cattaneo', email: 'elisa.flutter@flutter.it'));
    return Scaffold(
      floatingActionButton:
        FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async{
            var prova = await showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: EdgeInsets.only(
                        top: 8.0,
                        left: 8.0,
                        right: 8.0,
                        bottom: MediaQuery.of(context).viewInsets.bottom
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Inserisci il tuo commento'),
                        TextField(
                          controller: _textEditingController,
                          maxLines: 5,
                          onChanged: (value) {
                            _message = _textEditingController.text;
                          },
                        ),
                        Row(
                          children: [
                            TextButton(
                              child: const Text('Annulla'),
                              onPressed: () {
                                _message = null;
                                Navigator.of(context).pop();
                              }
                            ),
                            TextButton(
                              child: const Text('Pubblica'),
                              onPressed: () async{
                                if(_message == null || _message!.isEmpty){
                                  Navigator.of(context).pop(); //O ALERT DIALOG IN CUI SI AVVISA L'UTENTE
                                }

                                await ApiComment.addCommentTo(_idPost, _message!);

                                Navigator.of(context).pop();
                               /* final _comment = Comment(
                                    message: _message!,
                                    owner: _idUtente,
                                    post: _idPost
                                );
                                ApiComment.addCommentToViaComment(_comment);*/
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                }
            );
            if(prova == true){
              print('nuovi commenti ricevuti');
            }
          },
        ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                "https://04.cadwork.com/wp-content/uploads/logo-facebook.png",
                width: 100,
              ),
              const Divider(
                thickness: 4,
                color: Colors.blue,
              ),
              const Expanded(
                child: ContenutoPost()
              ),
            ],
          ),
        ),
      ),
    );
  }
}
