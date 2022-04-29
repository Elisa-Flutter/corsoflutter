import 'package:first_json/api/api_quotes.dart';
import 'package:first_json/models/quotes.dart';
import 'package:first_json/models/quotes_response.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late bool _hasMorePages;
  late int _skipQuotes;
  late Future<List<Quotes>> _future;
  late List<Quotes> _quotes;

  @override
  void initState() {
    super.initState();
    _hasMorePages = false;
    _skipQuotes = 0;
    _future = fetchQuotes();
    _quotes = <Quotes>[];
  }

  Future<List<Quotes>> fetchQuotes() async {
    QuotesResponse quotes =
        await ApiQuotes.quoteResponseFromInternet(skip: _skipQuotes);

    print(quotes.total - _skipQuotes - quotes.limit > 0);
    if (quotes.total - _skipQuotes - quotes.limit > 0) {
      setState(() {
        _quotes = _quotes + quotes.quotes;
        _hasMorePages = true;
        _skipQuotes = _skipQuotes + quotes.limit;
      });
    } else {
      setState(() {
        _quotes = _quotes + quotes.quotes;
        _hasMorePages = false;
        _skipQuotes = _skipQuotes + quotes.limit;
      });
    }

    return _quotes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON Quotes'),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          setState(() {
            _quotes = [];
            _hasMorePages = false;
            _skipQuotes = 90;
            _future = fetchQuotes();
          });
          return Future.value();
        },
        child: FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data is List<Quotes>) {
              List<Quotes> quotes = snapshot.data as List<Quotes>;

              return ListView.builder(
                  itemCount: quotes.length + (_hasMorePages ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (quotes.length == index) {
                      _future = fetchQuotes();
                      return const Center(child: CircularProgressIndicator());
                    }
                    return ListTile(
                      title: Text('${quotes[index].id} ${quotes[index].quote}'),
                      subtitle: Text(quotes[index].author),
                    );
                  });
            }

            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
