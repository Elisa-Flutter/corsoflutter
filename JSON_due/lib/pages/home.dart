import 'package:flutter/material.dart';
import 'package:json_due/api/api_quotes.dart';
import 'package:json_due/api/api_user.dart';
import 'package:json_due/models/quotes.dart';
import 'package:json_due/models/quotes_response.dart';
import 'package:json_due/models/user.dart';
import 'package:json_due/models/user_response.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<User> _listaQuotesVisualizzate;
  late bool _hasMoreQuotes;
  late int _skipQuotes;
  late Future<List<User>> _future;

  @override
  void initState() {
    super.initState();
    _listaQuotesVisualizzate = [];
    _hasMoreQuotes = false;
    _skipQuotes = 0;
    _future = _fetchQuotes();
  }

  Future<List<User>> _fetchQuotes() async{
    final UserResponse result = await ApiUser.getUserFromInternet();
    setState(() {
      _skipQuotes = _skipQuotes + result.limit;
      _hasMoreQuotes = (result.total - _skipQuotes > 0);
      _listaQuotesVisualizzate = _listaQuotesVisualizzate + result.users;
    });

    return _listaQuotesVisualizzate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          setState(() {
            _listaQuotesVisualizzate = [];
            _hasMoreQuotes = false;
            _skipQuotes = 0;
            _future = _fetchQuotes();
          });
          return Future.value();
        },
        child: FutureBuilder(
          future: _future,
          builder: (context, snapshot){
            if(snapshot.hasData && snapshot.data is List<User>){
              final listQuotes = snapshot.data as List<User>;

              return ListView.builder(
                  itemCount: listQuotes.length + (_hasMoreQuotes ? 1 : 0),
                  itemBuilder: (context, index){
                    if(index == listQuotes.length){
                      _future = _fetchQuotes();
                      return const Center(child:
                        CircularProgressIndicator(),);
                    }
                    return ListTile(
                      title: Text(listQuotes[index].weight.toString()),
                      subtitle: Text('Address: ${listQuotes[index].address}'),
                    );
                  }
              );
            }
            if(snapshot.hasError){
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }

            return const Center(child: CircularProgressIndicator(),);

          },
        ),
      ),
    );
  }
}
