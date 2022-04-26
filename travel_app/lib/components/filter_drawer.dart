import 'package:flutter/material.dart';
import 'package:travel_app/components/titolo.dart';
import 'package:travel_app/models/meta_turistica.dart';

class FilterDrawer extends StatefulWidget {
  final RangeValues selectedRating;
  final String? selectedCountry;
  final bool? available;
  final Function({int minRating, int maxRating, String? country, bool? available}) setFilters;


  const FilterDrawer({required this.selectedRating, required this.setFilters, this.selectedCountry,
    this.available = false, Key? key}) : super(key: key);

  @override
  State<FilterDrawer> createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  late RangeValues _selectedRating;
  late List<String> _countryList;
  String? _selectedCountry;
  late bool? _available;

  @override
  void initState(){
    super.initState();
    _selectedRating = widget.selectedRating;
    _selectedCountry = widget.selectedCountry;
    _available = widget.available;

    _countryList =
        MetaTuristica.listaMete.map((meta) => meta.country)
        .toSet()
        .toList();

    _countryList.sort();
  }


/*  final _formKey = GlobalKey<FormState>();*/

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const Text('Filtri'),
            Expanded(
              child: Form(
                child: ListView(
                  children: [
                    Text('Rating (attualmente selezionato da ${_selectedRating.start.toString().substring(0, 1)} a ${_selectedRating.end.toString().substring(0, 1)})'),
                    Row(
                      children: [
                        const Text('1'),
                        Expanded(
                          child: RangeSlider(
                          min: 1,
                          max: 5,
                          values: _selectedRating,
                          divisions: 4,
                          onChanged: (RangeValues value) {
                            setState(() {
                              _selectedRating = value;
                            });
                          },
                            labels: RangeLabels(
                              _selectedRating.start.toString().substring(0, 1),
                              _selectedRating.end.toString().substring(0, 1)
                            ),

                          ),
                        ),
                        const Text('5'),
                      ],
                    ),

                    FormField(
                      builder: (context) {
                        return InputDecorator(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder()
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String?>(
                                isDense: true,
                                value: _selectedCountry,
                                items: <DropdownMenuItem<String?>>[
                                  const DropdownMenuItem(
                                    child: Text('Nessuno stato selezionato'),
                                    value: null,
                                  )
                                ] +
                                    _countryList.map((country) =>
                                        DropdownMenuItem<String?>(
                                          child: Text(country),
                                          value: country,
                                        )
                                    ).toList(),
                                onChanged: (metaSelezionata){
                                  setState(() {
                                    _selectedCountry = metaSelezionata;
                                  });
                                }
                            ),
                          ),
                        );
                      },
                    ),

                    SwitchListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('Only available'),
                        value: _available ?? false,
                        onChanged: (toggle){
                          setState(() {
                            _available = toggle;
                          });
                        }
                    )

                  ]
                ),
              ),
            ),
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      setState(() {
                        _available = null;
                        _selectedCountry = null;
                        _selectedRating = const RangeValues(1, 5);
                      });
                    },
                    child: const Text('Reset')
                ),
                TextButton(
                    onPressed: () {
                      widget.setFilters(
                       minRating: _selectedRating.start.toInt(),
                       maxRating: _selectedRating.end.toInt(),
                       country: _selectedCountry,
                       available: _available == false ? null : _available
                      );
                      Navigator.of(context).pop();
                    },
                    child: Text('Applica'))
              ],
            )
          ],
        ),
      ),
    );



  }
   /* return Drawer(
      child: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const Titolo('Filtri'),
            Expanded(
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    Text(
                        "Rating (selezionato ${_selectedRating.start.toString().substring(0, 1)}, ${_selectedRating.end.toString().substring(0, 1)}):"),
                    Row(
                      children: [
                        const Text('1'),
                        Expanded(
                          child: RangeSlider(
                            min: 1,
                            max: 5,
                            onChanged: (RangeValues value) {
                              setState(() {
                                _selectedRating = value;
                              });
                            },
                            divisions: 4,
                            values: _selectedRating,
                            labels: RangeLabels(
                                _selectedRating.start
                                    .toString()
                                    .substring(0, 1),
                                _selectedRating.end.toString().substring(0, 1)),
                          ),
                        ),
                        const Text('5'),
                      ],
                    ),
                    FormField(
                      builder: (context) => InputDecorator(
                        decoration: const InputDecoration(
                          labelText: 'Stato',
                          border: OutlineInputBorder(),
                          isDense: true
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String?>(
                              isDense: true,
                              value: _selectedCountry,
                              items: <DropdownMenuItem<String?>>[
                                   const DropdownMenuItem(
                                        value: null,
                                        child: Text('Nessuno selezionato'))
                                  ] +
                                  _countryList
                                      .map((country) => DropdownMenuItem(
                                          value: country, child: Text(country)))
                                      .toList(),
                              onChanged: (countrySelected) {
                                setState(() {
                                  _selectedCountry = countrySelected;
                                });
                              }),
                        ),
                      ),
                    ),
                    SwitchListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('Solo available'),
                        value: _available,
                        onChanged: (value){
                          setState(() {
                            _available = value;
                          });
                        }
                    )
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _available = false;
                      _selectedCountry = null;
                      _selectedRating = const RangeValues(1, 5);
                      _formKey.currentState?.reset();
                    });

                  },
                  child: const Text('Reset')
              ),
              ElevatedButton(
                  onPressed: (){
                    widget.setFilters(
                      minRating: _selectedRating.start.toInt(),
                      maxRating: _selectedRating.end.toInt(),
                      country: _selectedCountry,
                      available: _available == true ? true : null
                    );
                    Navigator.of(context).pop();
                  },
                  child: const Text('Conferma')
              ),
            ],)
          ],
        ),
      ),
    );*/
}
