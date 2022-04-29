import 'package:flutter/material.dart';
import 'package:json_due/api/api_quotes.dart';
import 'package:json_due/models/quotes.dart';
import 'package:json_due/models/quotes_response.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Quotes> _listaQuotesVisualizzate;
  late bool _hasMoreQuotes;
  late int _skipQuotes;
  late Future<List<Quotes>> _future;

  @override
  void initState() {
    super.initState();
    _listaQuotesVisualizzate = [];
    _hasMoreQuotes = false;
    _skipQuotes = 0;
    _future = _fetchQuotes();
  }

  Future<List<Quotes>> _fetchQuotes() async{
    final QuotesResponse result = await ApiQuotes.getQuotesFromInternet(skip: _skipQuotes);
    setState(() {
      _skipQuotes = _skipQuotes + result.limit;
      _hasMoreQuotes = (result.total - _skipQuotes > 0);
      _listaQuotesVisualizzate = _listaQuotesVisualizzate + result.quotes;
    });

    return _listaQuotesVisualizzate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quotes'),
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
            if(snapshot.hasData && snapshot.data is List<Quotes>){
              final listQuotes = snapshot.data as List<Quotes>;

              return ListView.builder(
                  itemCount: listQuotes.length + (_hasMoreQuotes ? 1 : 0),
                  itemBuilder: (context, index){
                    if(index == listQuotes.length){
                      _future = _fetchQuotes();
                      return const Center(child:
                        CircularProgressIndicator(),);
                    }
                    return ListTile(
                      title: Text(listQuotes[index].quote),
                      subtitle: Text(listQuotes[index].author),
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
