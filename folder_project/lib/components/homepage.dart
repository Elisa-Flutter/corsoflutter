import 'package:flutter/material.dart';
import 'package:folder_project/models/cartella.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool gridViewOn = true;
  final SliverGridDelegate _sliverGridDelegate = const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2);

  void changeGridView() {
    setState(() {
      gridViewOn = !gridViewOn;
    });
  }
  final listCartelle = const [
    Cartella(
      title: 'Permanent tasks',
      iconData: Icons.folder,
      numTasks: 10
    ),
    Cartella(
      title: 'Current tasks',
      iconData: Icons.file_download_outlined,
      numTasks: 14
    ),
    Cartella(
      title: 'Next tasks',
      iconData: Icons.watch_later_outlined,
      numTasks: 2
    ),
    Cartella(
      title: 'Future tasks',
      iconData: Icons.calendar_today_rounded,
      numTasks: 14
    ),
    Cartella(
      title: 'Completed tasks',
      iconData: Icons.file_download_done_outlined,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(gridViewOn ? Icons.list : Icons.grid_view_outlined),
          onPressed: changeGridView,
        ),
        title: const Text('Folders & Projects'),
        actions: const [
           Padding(
             padding: EdgeInsets.only(right: 16.0),
             child: Icon(Icons.close),
           )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Folders',
              style: TextStyle(
                color: Colors.blueGrey.shade400,
                fontSize: 30,
              ),
            ),
          ),
          Expanded(
            child:
            gridViewOn
             ? GridView.builder(
                itemCount: listCartelle.length,
                gridDelegate: _sliverGridDelegate,
                itemBuilder: (context, index){
                  return Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blueGrey.withOpacity(0.3),
                            ),
                            height: 40,
                          ),
                          Icon(listCartelle[index].iconData)
                        ],
                      ),
                      Text(listCartelle[index].title),
                      Text('${listCartelle[index].numTasks} Tasks')
                    ],
                    ),
                  );
                }
            )

            : ListView.builder(
                itemCount: listCartelle.length,
                itemBuilder: (context, index){
                  return ListTile(
                    title: Text(listCartelle[index].title),
                    leading: Icon(listCartelle[index].iconData),
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}
