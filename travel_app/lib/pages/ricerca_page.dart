import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:travel_app/components/card_place.dart';
import 'package:travel_app/components/filter_drawer.dart';
import 'package:travel_app/components/ricerca.dart';
import 'package:travel_app/models/interessi.dart';
import 'package:travel_app/models/meta_turistica.dart';

class RicercaPage extends StatefulWidget {
  const RicercaPage({Key? key}) : super(key: key);

  @override
  _RicercaPageState createState() => _RicercaPageState();
}

class _RicercaPageState extends State<RicercaPage> {
  late final GlobalKey<ScaffoldState> _scaffoldKey;

  late List<MetaTuristica> _risultatiRicerca;
  late bool endDrawerOpen;

  //contengono i filtri ATTUALMENTE applicati
  String? _parolaDiRicerca;
  late int _minRating;
  late int _maxRating;
  String? _country/* = null*/;
  bool? _available;
  List<Interessi>? _interessi;

  @override
  void initState() {
    super.initState();
    //La prima volta che creo questo widget, posso definire
    //dei valori di default per i filtri ATTUALMENTE applicati
    _minRating = 1;
    _maxRating = 5;
    _risultatiRicerca = MetaTuristica.listaMete;
    _scaffoldKey = GlobalKey();

    //per aprire il drawer automaticamente, dopo aver aperto la pagina di ricerca
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      final modalArgs = ModalRoute.of(context)?.settings.arguments ?? {};

      if(modalArgs is Map<String,bool>
          && modalArgs['openDrawer'] == true) {
       // Scaffold.of(context).openEndDrawer();
        _scaffoldKey.currentState?.openEndDrawer();
      }
    });
  }


  //vado ad impostare i filtri addizionali (del drawer) e poi
  //filtro la lista grazie a _filtraMete
  void _setAdditionalFilters({
    int minRating = 1,
    int maxRating = 5,
    String? country,
    bool? available,
    List<Interessi>? interessi,
  }){
    //non ho bisogno di setState perché nella pagina di ricerca
    //non vado a esporre nessuno di questi dati in questa pagina
    // (es: non ho nessun Text(_available.toString()) )
    //setState(() {
      _minRating = minRating;
      _maxRating = maxRating;
      _country = country;
      _available = available;
      _interessi = interessi;
    //});

    //non devo wrappare la funzione seguente da uno setState perché la funzione
    //_filtraMete fa già setState al suo interno
    _filtraMete(_parolaDiRicerca ?? '');
  }

  //a partire da una meta, va a verificare se quella meta corrisponde ai filtri
  //presenti nelle variabili corrispondenti
  bool _additionalFiltersFor(MetaTuristica meta){
   return meta.rating >= _minRating
        && meta.rating <= _maxRating
        && (_country == null || meta.country == _country)
        && (_available == null || _available == false || meta.available == _available)
        && (_interessi == null || _interessi!.any((interesse) => (meta.interessi?.contains(interesse) ?? false)));
  }

  void _filtraMete(String parolaDiRicerca){
    //setta la variabile di stato _parolaDiRicerca basandosi sulla parola
    //ricercata nel widget di ricerca
    _parolaDiRicerca = parolaDiRicerca;
    if(parolaDiRicerca.isEmpty){
      setState(() {
        //se non ho filtri per parole di ricerca,
        //la lista deve seguire i filtri applicati nel drawer
        _risultatiRicerca = MetaTuristica.listaMete
            .where((meta) => _additionalFiltersFor(meta))
            .toList();
      });
    } else {
      setState(() {
        //estraggo le mete DOVE la parola di ricerca in minuscolo
        // è contenuta nella città in minuscolo
        //inoltre filtro per i filtri applicati nel drawer
        _risultatiRicerca = MetaTuristica.listaMete.where(
                (meta) {
                  return meta.city.toLowerCase().contains(parolaDiRicerca.toLowerCase())
                        && _additionalFiltersFor(meta);
                })
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
      ),
      endDrawerEnableOpenDragGesture: false,
      endDrawer: FilterDrawer(
        selectedRating: RangeValues(_minRating.toDouble(), _maxRating.toDouble()),
        setFilters: _setAdditionalFilters,
       selectedCountry: _country,
       available: _available,
       interessi: _interessi,
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
