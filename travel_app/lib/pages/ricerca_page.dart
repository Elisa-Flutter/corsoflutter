import 'package:flutter/material.dart';
import 'package:travel_app/components/ricerca.dart';
import 'package:travel_app/models/meta_turistica.dart';

class RicercaPage extends StatefulWidget {
  const RicercaPage({Key? key}) : super(key: key);

  @override
  _RicercaPageState createState() => _RicercaPageState();
}

class _RicercaPageState extends State<RicercaPage> {
  late List<MetaTuristica> _currentList;

  @override
  void initState() {
    super.initState();
    _currentList = MetaTuristica.listaMete;
  }

  _filtraMete(String citta){
    if(citta.isEmpty && _currentList != MetaTuristica.listaMete){
      setState(() {
        _currentList = MetaTuristica.listaMete;
      });
    } else {
      setState(() {
        _currentList = MetaTuristica.listaMete.where(
                (meta) => meta.city.toLowerCase().contains(citta.toLowerCase())).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Ricerca(shouldGoToSearchPage: false, callback: _filtraMete,),
    );
  }
}
