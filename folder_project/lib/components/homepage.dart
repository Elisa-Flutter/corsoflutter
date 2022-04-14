import 'package:flutter/material.dart';
import 'package:folder_project/components/cartelle_in_griglia.dart';
import 'package:folder_project/components/cartelle_in_lista.dart';
import 'package:folder_project/components/custom_app_bar.dart';
import 'package:folder_project/components/titolo.dart';
import 'package:folder_project/models/cartella.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool _gridViewOn = false;

  void toggleGridView() {
    setState(() {
      _gridViewOn = !_gridViewOn;
    });
  }

  final _listaCartelle = const [
    Cartella(
      iconData: Icons.folder,
      titolo: 'Permanent Tasks',
      numTask: 10,
    ),
    Cartella(
      iconData: Icons.system_update_alt_outlined,
      titolo: 'Current Tasks',
      numTask: 14,
    ),
    Cartella(
      iconData: Icons.watch_later_outlined,
      titolo: 'Next Tasks',
      numTask: 2,
    ),
    Cartella(
      iconData: Icons.calendar_today_rounded,
      titolo: 'Permanent Tasks',
      numTask: 6,
    ),
    Cartella(
      iconData: Icons.file_download_done_outlined,
      titolo: 'Completed Tasks',
      numTask: 0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(callback: toggleGridView, gridViewOn: _gridViewOn,),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           const Titolo(title: 'Folders'),
          _gridViewOn
           ? Expanded(
              child: CartelleInGriglia(_listaCartelle)
            )
              : Expanded(
                  child: CartelleInLista(_listaCartelle)
                )
        ],
      ),
    );
  }
}
