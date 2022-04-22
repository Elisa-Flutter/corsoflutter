import 'package:flutter/material.dart';
import 'package:travel_app/components/ricerca.dart';

class RicercaPage extends StatefulWidget {
  const RicercaPage({Key? key}) : super(key: key);

  @override
  _RicercaPageState createState() => _RicercaPageState();
}

class _RicercaPageState extends State<RicercaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Ricerca(shouldGoToSearchPage: false,),
    );
  }
}
