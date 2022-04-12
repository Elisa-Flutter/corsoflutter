import 'package:flutter/material.dart';
import 'package:lezione_2/components/card_menu.dart';

void main() {
  runApp(const Mockup());
}

class Mockup extends StatelessWidget {
  const Mockup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App da Mockup',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'Discovery'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
        title: Text(widget.title),
     ),
     bottomNavigationBar: BottomAppBar(
       color: Colors.grey,
       child: Padding(
         padding: const EdgeInsets.symmetric(
           vertical: 8
         ),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: const [
             Icon(Icons.home, size: 45),
             Icon(Icons.pin_drop, size: 45),
             Icon(Icons.person, size: 45)
           ],
         ),
       )
     ),
     body: Padding(
       padding: const EdgeInsets.all(8.0),
       child: Column(
         children: [
           Expanded(
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround ,
               children: const [
                  Expanded(
                      child: CardMenu(
                        icona: Icons.local_cafe, titolo: 'Bars & Hotels', numeroPlaces: 42,)),
                  Expanded(
                      child: CardMenu(
                        icona: Icons.handyman, titolo: 'Fine dining', numeroPlaces: 15,)),
               ],
          ),
           ),
           Expanded(
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround ,
               children: const [
                 Expanded(
                     child: CardMenu(icona: Icons.local_cafe, titolo: 'Bars & Hotels', numeroPlaces: 42,)),
                 Expanded(
                     child: CardMenu(icona: Icons.handyman, titolo: 'Fine dining', numeroPlaces: 15,)),
               ],
             ),
           ),
           Expanded(
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround ,
               children: const [
                 Expanded(child: CardMenu(icona: Icons.local_cafe, titolo: 'Bars & Hotels', numeroPlaces: 42,)),
                 Expanded(child: CardMenu(icona: Icons.handyman, titolo: 'Fine dining', numeroPlaces: 15,)),
               ],
             ),
           ),
         ]
       ),
     ),
   );
  }
}
