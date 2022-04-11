abstract class Animal{
  final int zampe;
  final String nome;
  Animal(this.zampe, this.nome);

  void speak();

  void cammina(){
    print('take a step');
  }
}

class Fringuello extends Animal with Branco{
  Fringuello(String nome) : super(2, nome);

  @override
  final branco = false;

  @override
  void speak(){
    print('cip cip');
  }
}

class Leone extends Animal with Caccia, Branco{
  Leone(String nome): super(4, nome);
  @override
  void speak(){
    print('roar');
  }
}

class Lupo extends Animal with Caccia{
  Lupo(String nome) : super(4, nome);

  @override
  void speak(){
    print('wof wof');
  }
}

mixin Caccia{
  void caccia(){
    print('inizia a correre');
  }
}

mixin Branco{
  bool branco = true;
}


void main() {
  var fringuello = Fringuello('Pippo');
  var leone = Leone('Pluto');
  var lupo = Lupo('Paperino');

  print(fringuello.nome);

  fringuello.speak();
  leone.speak();
  lupo.speak();

  leone.caccia();
  lupo.caccia();

  print('Finguello branco = ${fringuello.branco}');
  print('Leone branco = ${leone.branco}');
}

