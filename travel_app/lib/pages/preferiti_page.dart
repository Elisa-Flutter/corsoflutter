import 'package:flutter/material.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';
import 'package:travel_app/components/card_place.dart';
import 'package:travel_app/models/meta_turistica.dart';

class PreferitiPage extends StatelessWidget {
  final StreamingSharedPreferences sp;
  const PreferitiPage(this.sp, {Key? key}) : super(key: key);

  List<MetaTuristica> getMetePreferite(List<String> _preferences){
    List<MetaTuristica> metePreferite = [];
    for (var meta in MetaTuristica.listaMete) {
      if(_preferences.contains(meta.city)){
        metePreferite.add(meta);
      }
    }
    return metePreferite;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PreferenceBuilder<List<String>>(
        preference: sp.getStringList('faves', defaultValue: []),
        builder: (context, _preferenceResult){
          List<MetaTuristica> metePreferite = getMetePreferite(_preferenceResult);
          return ListView.builder(
              itemCount: metePreferite.length,
              itemBuilder: (context, index){
                return CardPlace(metePreferite[index]);
              }
          );
        },
      )
    );
  }
}
