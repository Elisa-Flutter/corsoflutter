import 'package:flutter/material.dart';
import 'package:preferiti/models/pizza.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pizze'),
      ),
      body: ListView.builder(
        itemCount: Pizza.listaPizze.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(Pizza.listaPizze[index].nome),
            trailing: IconButton(
              icon: const Icon(Icons.favorite_border),
              onPressed: () => print('vorrei essere aggiunto ai preferiti'),
            ),
          );
        },
      ),
    );
  }
}
