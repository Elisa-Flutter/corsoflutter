import 'package:flutter/material.dart';
import 'package:folder_project/models/cartella.dart';

class CartelleInGriglia extends StatelessWidget {
  final List<Cartella> _listaCartelle;
  const CartelleInGriglia(this._listaCartelle, {Key? key}) : super(key: key);

  final _gridDelegate = const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2
  );

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: _gridDelegate,
        itemCount: _listaCartelle.length,
        itemBuilder: (context, index) => Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blueGrey.withOpacity(.1)
                      ),
                    ),
                    Icon(
                      _listaCartelle[index].iconData,
                      color: Colors.blue,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(_listaCartelle[index].titolo,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Text('${_listaCartelle[index].numTask} Tasks',
                  style: const TextStyle(
                      color: Colors.black54
                  ),
                ),
              ],
            )
        )
    );
  }
}
