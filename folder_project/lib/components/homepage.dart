import 'package:flutter/material.dart';
import 'package:folder_project/models/cartella.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool _gridViewOn = true;
  final _gridDelegate = const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2
  );

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
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: toggleGridView,
          icon: Icon(_gridViewOn ? Icons.list : Icons.grid_view),
        ),
        title: const Text('Folders & Project'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.close),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Folders', style: TextStyle(fontSize: 20, color: Colors.black54),),
          ),
          _gridViewOn
           ? Expanded(
              child: GridView.builder(
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
              )
          )
              : Expanded(
              child: ListView.builder(
                  itemCount: _listaCartelle.length,
                  itemBuilder: (context, index) =>
                      ListTile(
                        leading: Icon(_listaCartelle[index].iconData),
                        title: Text(_listaCartelle[index].titolo),
                      )
              )
          )
        ],
      ),
    );
  }
}
