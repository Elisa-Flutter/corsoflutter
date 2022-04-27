import 'package:flutter/material.dart';
/*
class Variabili{

  //bool = booleano (aka: o true o false)
  bool isEven = true;

  ! //NOT -> negazione
  && //AND -> tutte le condizioni devono essere vere per risultare vere
  || //OR -> almeno una delle condizioni deve essere true per risultare true


  == //UGUAGLIANZA

  bool piove = true;
  bool sole = false;
  bool vento = true;

  if(sole){
    print('non porto ombrello');
  }

  if(!sole || piove){
    print('porto ombrello');
  }

  if(piove && vento){
    print('porto ombrello');
  }

  if(!sole || piove && vento)
    //1) !sole, 2) piove && vento, 3) (!sole) || (piove && vento)
    //1) true, 2) true, 3) (true) || (true) => true

  String elisa = 'sono una stringa non vuota';
    if(elisa.isNotEmpty || piove);

  String? stringaNulla = null;
  if(strngaNulla != null && stringaNulla == 'elisa'){

  }



  // = assegnazione
  // == confronto
  if('elisa' == 'elisa'){} //true
  if('elisa' == 'catatneo') //false
  if('elisa' != 'cattaneo') //true


  //numeri interi, senza virgola, compresi i negativi
  int intero = -1;

  //numeri con la virgola
  double virgola = 1.2;

  List<String> listaStringaUno = ["uno", "due", "tre"];
  List<String> listaStringaDue = ['uno', 'due', 'tre'];
  List<double> listaDouble = [1.1, 1.2, 1.3];
  List<int> listaInteri = [1, 1, 1];
  List<bool> listaBool = [true, false, false];
  List<dynamic> listaDynamic = [1, 1.2, "false", true];

  //Map<Key,Value>

  Map mappa = {
    "nome" : "Elisa",
    "cognome": "Cattaneo",
    1: true,
  };

  Map<String, dynamic> mappaDue = {
    "eta": 26,
    "nome" : "Elisa",
    "cognome": "Cattaneo",
    "haAnimali": true
  };

  String cognome = mappaDue['cognome'];

  String maggio = 'Maggio';
  String settembre = 'Settembre';

  //NON SI FA
  String maggioSettembre = maggio + settembre;

  //COSÌ SÌ
  String maggioSettembreCorretta = '$maggio$settembre'; //MaggioSettembre
  String maggioSettembreCorrettaDue = '$maggio $settembre'; //Maggio Settembre
  String maggioSettembreSbagliataDue = 'maggio settembre'; //maggio settembre
  String maggioSettembreCorrettaTre = '2 + 3 = ${classe.attributo}'; //2 + 3 = 5
  String maggioSettembreCorrettaQuattro = '2 + 3 = ${lista[2]}'; //2 + 3 = 5


  //per String, List, Map
  .isEmpty => torna true se il valore è vuoto, altrimenti false
  .isNotEmpty => torna true se il valore non è vuoto, altrimenti false

  maggio.isEmpty; // maggio == '';
  maggio.isNotEmpty;// maggio != '';

  lista.isEmpty; // lista == [];
  lista.isNotEmpty; // lista != [];

  mappa.isEmpty; // mappa == {};
  mappa.isNotEmpty; // mappa != {};


  num numeric;

  Object oggetto;

  if(isEven){

  }


}

class Persona{

}
*/