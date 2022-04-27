class Pizza{
  final int id;
  final String nome;

  Pizza(this.id, this.nome);

  static List<Pizza> get listaPizze {
    return [
      Pizza(1, 'Marinara'),
      Pizza(2, 'Margherita'),
      Pizza(3, 'Prosciutto e funghi'),
      Pizza(4, 'Diavola'),
      Pizza(5, 'Quattro stagioni'),
      Pizza(6, 'Quattro formaggi'),
      Pizza(7, 'Vegetariana'),
      Pizza(8, 'Capricciosa'),
      Pizza(9, 'Viennese'),
      Pizza(10, 'Sole'),
    ];
  }
}