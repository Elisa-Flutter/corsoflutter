class Pizza{
  final String nome;

  Pizza(this.nome);

  static List<Pizza> get listaPizze {
    return [
      Pizza('Marinara'),
      Pizza('Margherita'),
      Pizza('Prosciutto e funghi'),
      Pizza('Diavola'),
      Pizza('Quattro stagioni'),
      Pizza('Quattro formaggi'),
      Pizza('Vegetariana'),
      Pizza('Capricciosa'),
      Pizza('Viennese'),
      Pizza('Sole'),
    ];
  }
}