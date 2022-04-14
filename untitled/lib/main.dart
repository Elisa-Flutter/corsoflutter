import 'package:flutter/material.dart';
import './components/header.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MaterialApp(
        home: Scaffold(
          body: Container(
            color: Colors.blue,
            child: Column(
              children: [
                const Header(),

                Expanded(child:
                  ListView(
                    children: [
                      Container(
                        color: Colors.white,
                        child: ListTile(
                          // dense: true,
                          title: Text('Mostra un messaggio'),
                          subtitle: Text('Uscirà un messaggio dal basso'),
                          leading: CircleAvatar(
                            child: Text('EC'),
                            backgroundColor: Colors.blue,
                          ),
                          trailing: Icon(Icons.chevron_right),
                          // contentPadding: EdgeInsets.all(20),
                            ),
                        ),
                    ],
                  )
                ),
                /*Container(
                  color: Colors.purple,
                  height: 400,
                  width: 200,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 400,
                        width: 200,
                        color: Colors.white,
                      ),
                      Container(
                        height: 100,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green
                        ),
                      ),
                      Container(
                        height: 40,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.yellow
                        ),
                      ),
                    ],
                  ),
                ),*/

                /*Expanded(
                    child: GridView.extent(
                        maxCrossAxisExtent: 100,
                        children: [
                          Container(
                            height: 300,
                            width: 300,
                            color: Colors.orange,
                            child: Icon(Icons.person),
                          ),
                          Container(
                            height: 300,
                            width: 300,
                            color: Colors.green,
                            child: Icon(Icons.person),
                          ),
                          Container(
                            height: 300,
                            width: 300,
                            color: Colors.lightBlueAccent,
                            child: Icon(Icons.person),
                          ),
                          Container(
                            height: 300,
                            width: 300,
                            color: Colors.amber,
                            child: Icon(Icons.person),
                          ),
                          Container(
                            height: 300,
                            width: 300,
                            color: Colors.red,
                            child: Icon(Icons.person),
                          )
                        ],
                    )
                )*/
              ],
            ),
          ),
        )
      ),
    );
  }
}
