/*
* Creare una classe per un personaggio di un videogioco:
Una classe base personaggio (astratta):
nome + punti vita + statistiche base difesa / danno
funzioni base di attacco e difesa
funzione ultimate
Tre classi che estendono personaggio (tank / healer / damage) che avranno:
dei modificatori per (punti difesa / cura / danno)
Una classe mixin scudo, da dare a tank e healer
Una classe mixin arma da dare a tank e damage
* */

mixin Scudo{
  //aggiunge 5 alla difesa (-5 danni subiti)
  int modScudo = -5;

  void alzaScudo(){
    print ('Muro di scudi!');
  }
}

mixin Arma{
  //Aggiunge 3 all'attacco
  int modArma = 3;

  void senzaPieta(){
    print('1 shot 1 kill');
  }
}

abstract class Personaggio{
  final String nome;
  final int puntiVita;
  final int difesa;
  final int danno;
  Personaggio(this.nome, this.puntiVita, this.difesa, this.danno);

  int attacca();
  int difendi();
  void ultimate();
}

class Tank extends Personaggio with Arma, Scudo{
  final int modDifesa;
  Tank({
    required String nome,
    required int puntiVita,
    required int difesa,
    required int danno,
    required this.modDifesa,
  }) : super(nome, puntiVita, difesa, danno);

  @override
  int get difesa => super.difesa + modDifesa + modScudo;

  @override
  int get danno => super.danno + modArma;

  @override
  int attacca() {
    //fa 5 danni per attacco
    return 5;
  }

  @override
  int difendi() {
    //riceve 2 danni in meno perché si difende
    return -2;
  }

  @override
  void ultimate() {
    print('Il mio scudo proteggerà tutti!');
  }
}

class Healer extends Personaggio with Scudo{
  final int modCura;
  Healer({
    required String nome,
    required int puntiVita,
    required int difesa,
    required int danno,
    required this.modCura,
  }) : super(nome, puntiVita, difesa, danno);

  @override
  int get difesa => super.difesa + modCura + modScudo;

  @override
  int attacca() {
    //fa 2 danni per attacco
    return 2;
  }

  @override
  int difendi() {
    //l'healer non si sa difendere
    return 0;
  }

  @override
  void ultimate() {
    print('Io vi salvero!');
  }
}

class Dps extends Personaggio with Arma{
  final int modAttacco;

  Dps({
    required String nome,
    required int puntiVita,
    required int difesa,
    required int danno,
    required this.modAttacco,
  }) : super(nome, puntiVita, difesa, danno);

  @override
  int get danno => super.danno + modAttacco + modArma;

  @override
  int attacca() {
    //fa 8 danni per attacco
    return 8;
  }

  @override
  int difendi() {
    //il dps ha un giubbotto antiproiettile
    return -1;
  }

  @override
  void ultimate() {
    print('Vi farò saltare per aria!');
  }
}

void main(){
  var tracer = Dps(nome: 'Tracer', puntiVita: 150, difesa: 0, danno: 4, modAttacco: 2);
  var mercy = Healer(nome: 'Mercy', puntiVita: 250, difesa: -2, danno: 2, modCura: 5);
  var reinhartd = Tank(nome: 'Reinhartd', puntiVita: 450, difesa: -4, danno: 3, modDifesa: -2);

  print('''Tracer: \n\t 
          Danno: ${tracer.danno}, \n\t 
          Punti vita: ${tracer.puntiVita}, \n\t 
          Attacco: ${tracer.attacca()}, \n\t
          Difesa: ${tracer.difendi()}, \n\t
          ''');
  tracer.ultimate();

  print('''Mercy: \n\t 
          Danno: ${mercy.danno}, \n\t 
          Punti vita: ${mercy.puntiVita}, \n\t 
          Attacco: ${mercy.attacca()}, \n\t
          Difesa: ${mercy.difendi()}, \n\t
          ''');
  mercy.ultimate();

  print('''Rein: \n\t 
          Danno: ${reinhartd.danno}, \n\t 
          Punti vita: ${reinhartd.puntiVita}, \n\t 
          Attacco: ${reinhartd.attacca()}, \n\t
          Difesa: ${reinhartd.difendi()}, \n\t
          ''');
  reinhartd.ultimate();
}