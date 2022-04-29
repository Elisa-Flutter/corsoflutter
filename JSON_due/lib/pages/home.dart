import 'package:flutter/material.dart';
import 'package:json_due/api/api_quotes.dart';
import 'package:json_due/models/quotes_response.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quotes'),
      ),
      body: FutureBuilder(
        future: ApiQuotes.getQuotesFromInternet(),
        builder: (context, snapshot){
          if(snapshot.hasData && snapshot.data is QuotesResponse){
            final listQuotes = (snapshot.data as QuotesResponse).quotes;

            return ListView.builder(
                itemCount: listQuotes.length,
                itemBuilder: (context, index){
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
    );
  }
}
