import 'package:flutter/material.dart';
import 'package:json_due/api/api_quotes.dart';
import 'package:json_due/api/api_user.dart';
import 'package:json_due/models/quotes_response.dart';
import 'package:json_due/models/user_response.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quotes'),
      ),
      body: FutureBuilder(
        future: ApiUser.getUserFromInternet(),
        builder: (context, snapshot){
          if(snapshot.hasData && snapshot.data is UserResponse){
            final listQuotes = (snapshot.data as UserResponse).users;

            return ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index){
                  return ListTile(
                    title: Text('prova'),
                    subtitle: Text('prova'),
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
