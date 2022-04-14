import 'package:flutter/material.dart';
import 'package:folder_project/models/cartella.dart';

class CartelleInLista extends StatelessWidget {
  final List<Cartella> _listaCartelle;
  const CartelleInLista(this._listaCartelle, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _listaCartelle.length,
        itemBuilder: (context, index) =>
            ListTile(
              leading: Icon(_listaCartelle[index].iconData),
              title: Text(_listaCartelle[index].titolo),
            )
    );
  }
}
