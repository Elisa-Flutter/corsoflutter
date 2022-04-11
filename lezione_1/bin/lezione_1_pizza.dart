class PizzaMargherita{
  final bool pomodoro;
  final bool mozzarella;
  PizzaMargherita(this.pomodoro, this.mozzarella);
  int get minutiDiCottura => 5;

  String ingredienti () {
    String ingredienti = '';
    if(pomodoro) {ingredienti = 'pomodoro';}
    if(mozzarella) {ingredienti = '$ingredienti, mozzarella';}
    return ingredienti;
  }
}

class PizzaCapricciosa extends PizzaMargherita{
  final bool carciofi;
  final bool prosciutto;
  PizzaCapricciosa(this.carciofi, this.prosciutto) : super(true, true);

  @override
  int get minutiDiCottura => 6;

  @override
  String ingredienti(){
    String ingredienti = super.ingredienti();
    if(carciofi) {ingredienti = '$ingredienti, carciofi';}
    if(prosciutto) {ingredienti = '$ingredienti, prosciutto';}
    return ingredienti;
  }
}

void main() {
  final pizzaUno = PizzaMargherita(true, false);
  print(pizzaUno.ingredienti());

  final pizzaDue = PizzaCapricciosa(true, true);
  print(pizzaDue.ingredienti());
}


