import 'package:flutter/material.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';
import 'package:travel_app/components/card_place.dart';
import 'package:travel_app/models/meta_turistica.dart';

class PreferitiPage extends StatefulWidget {
  const PreferitiPage({Key? key}) : super(key: key);

  @override
  State<PreferitiPage> createState() => _PreferitiPageState();
}

class _PreferitiPageState extends State<PreferitiPage> with SingleTickerProviderStateMixin{
  late StreamingSharedPreferences sp;
  List<MetaTuristica> list = [];

  initSp() async{
    sp = await StreamingSharedPreferences.instance;

    final faves = (sp.getStringList("faves", defaultValue: []));
    for (var meta in MetaTuristica.listaMete) {
      if(await faves.contains(meta.city)){
        print(meta.city);
        list.add(meta);
      }
    }
    setState(() {
    });
  }


  @override
  void initState(){
    super.initState();
    initSp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index){
          return AnimatedIcon(
              progress:  AnimationController(vsync: this, duration: Duration(milliseconds: 450)),
              icon: AnimatedIcons.event_add);

          //CardPlace(list[index]);
        }
    ),
    );
  }
}
