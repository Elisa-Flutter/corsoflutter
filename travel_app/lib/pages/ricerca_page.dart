import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:travel_app/components/card_place.dart';
import 'package:travel_app/components/filter_drawer.dart';
import 'package:travel_app/components/ricerca.dart';
import 'package:travel_app/models/meta_turistica.dart';

class RicercaPage extends StatefulWidget {
  const RicercaPage({Key? key}) : super(key: key);

  @override
  _RicercaPageState createState() => _RicercaPageState();
}

class _RicercaPageState extends State<RicercaPage> {
  late List<MetaTuristica> _risultatiRicerca;
  late bool endDrawerOpen;
  late final GlobalKey<ScaffoldState> _scaffoldKey;
  String? _parolaDiRicerca;

  late int _minRating;
  late int _maxRating;
  String? _country/* = null*/;


  bool? _available;

  @override
  void initState() {
    super.initState();

    _minRating = 1;
    _maxRating = 5;

    _risultatiRicerca = MetaTuristica.listaMete;
    _scaffoldKey = GlobalKey();

    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      final modalArgs = ModalRoute.of(context)?.settings.arguments ?? [];
      if(modalArgs is List
          && modalArgs.isNotEmpty
          && modalArgs[0] is Map<String, dynamic>
          && modalArgs[0]['filterOpen'] == true){
        _scaffoldKey.currentState?.openEndDrawer();
      }
    });
  }


  void _additionalFilters({
    int minRating = 1,
    int maxRating = 5,
    String? country
  }){
    setState(() {
      _minRating = minRating;
      _maxRating = maxRating;
      _country = country;


      _risultatiRicerca = _risultatiRicerca.where((risultato){
        return
          risultato.rating >= minRating
          && risultato.rating <= maxRating
          && (country == null || risultato.country == country)
        ;
      }).toList();
    });
  }

  /*_additionalFilters(
      {int minRating = 1, int maxRating = 5, String? country, bool? available}){
    setState(() {
      _minRating = minRating;
      _maxRating = maxRating;
      _country = country;
      _available = available;

      print('minRating = $minRating, maxRating = $maxRating, country = $country, available = $available');
      _filtraMete(_parolaDiRicerca?? '');
      _risultatiRicerca = _risultatiRicerca.where((meta) {
        return meta.rating >= minRating
            && meta.rating <= maxRating
            && (country == null || country.isEmpty || meta.country == country)
            && (available == null || meta.available == available);
        }
        ).toList();
      });}
*/

  void _filtraMete(String parolaDiRicerca){
    _parolaDiRicerca = parolaDiRicerca;
    if(parolaDiRicerca.isEmpty){
      setState(() {
        _risultatiRicerca = MetaTuristica.listaMete;
      });
    } else {
      setState(() {
        //estraggo le mete DOVE la parola di ricerca in minuscolo
        // è contenuta nella città in minuscolo
        _risultatiRicerca = MetaTuristica.listaMete.where(
                (meta) => meta.city.toLowerCase()
                    .contains(parolaDiRicerca.toLowerCase()))
            .toList();
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Ricerca'),
        actions: [
          IconButton(
              onPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
              icon: Icon(Icons.star)),
          SizedBox(width: 0)
        ],
      ),
      endDrawerEnableOpenDragGesture: false,
      endDrawer: FilterDrawer(
        selectedRating: RangeValues(_minRating.toDouble(), _maxRating.toDouble()),
        setFilters: _additionalFilters,
       selectedCountry: _country,
       /* available: _available ?? false,
        selectedCountry: _country,
        selectedRating: RangeValues(_minRating.toDouble(), _maxRating.toDouble()),
      */

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Ricerca(amIOnHomepage: false, callback: _filtraMete),
            if(_risultatiRicerca.isNotEmpty) Text('Risultati trovati: ${_risultatiRicerca.length}'),
            _risultatiRicerca.isEmpty
            ? const Text('Nessun risultato per la ricerca')
            : Expanded(
                child: ListView.builder(
                    itemCount: _risultatiRicerca.length,
                    itemBuilder: (context, index){
                      return Container(
                          height: 100,
                          child: CardPlace(_risultatiRicerca[index]));
                    }
                )
            )
          ],
        ),
      ),
    );
  }
}
