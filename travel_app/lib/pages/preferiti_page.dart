import 'package:flutter/material.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';
import 'package:travel_app/components/card_place.dart';
import 'package:travel_app/models/meta_turistica.dart';

class PreferitiPage extends StatefulWidget {
  final StreamingSharedPreferences sp;
  const PreferitiPage(this.sp, {Key? key}) : super(key: key);

  @override
  State<PreferitiPage> createState() => _PreferitiPageState();
}

class _PreferitiPageState extends State<PreferitiPage> with SingleTickerProviderStateMixin{
  List<MetaTuristica> getMete(List<String> meteString){
    List<MetaTuristica> list = [];
    for (var meta in MetaTuristica.listaMete) {
      if(meteString.contains(meta.city)){
    print(meta.city);
    list.add(meta);
    }
  }
    return list;
  }


  @override
  void initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PreferenceBuilder<List<String>>(
        preference: widget.sp.getStringList('faves', defaultValue: []),
        builder: (context, faveListString){
          List<MetaTuristica> listFaveMete = getMete(faveListString);
         return ListView.builder(
              itemCount: listFaveMete.length,
              itemBuilder: (context, index){
                return CardPlace(listFaveMete[index]);
              }
          );
        },
      )
    );
  }
}
