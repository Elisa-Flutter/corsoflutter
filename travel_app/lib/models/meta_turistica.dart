import 'package:travel_app/models/interessi.dart';

class MetaTuristica{
  final String city;
  final String country;
  final int rating;
  final int minPrice;
  final int maxPrice;
  final bool available;
  final bool raccomanded;
  final String imageUrl;
  final String description;
  final List<Interessi>? interessi;

  const MetaTuristica({
    required this.city,
    required this.country,
    required this.rating,
    required this.minPrice,
    required this.maxPrice,
    required this.available,
    required this.raccomanded,
    required this.imageUrl,
    required this.description,
    this.interessi
  });

  static List<MetaTuristica> get listaMete {
    return const [
      MetaTuristica(
          city: 'Roma',
          country: 'Italia',
          rating: 5,
          minPrice: 200,
          maxPrice: 1400,
          available: true,
          raccomanded: true,
          imageUrl: 'https://citynews-romatoday.stgy.ovh/~media/horizontal-mid/602411987578/colosseo-roma-3.jpg',
          description: """Roma (AFI: /ˈroma/[6], pronuncia[?·info]) è la capitale d'Italia. È altresì capoluogo dell'omonima città metropolitana e della regione Lazio. Il comune di Roma è dotato di un ordinamento amministrativo speciale, denominato Roma Capitale e disciplinato da una legge dello Stato.[7]
Contando 2 759 670 abitanti[3][8], è il comune più popoloso d'Italia e il terzo dell'Unione europea dopo Berlino e Madrid[3]. Mentre con 1287,36 km² è il comune più esteso d'Italia e dell'Unione europea, nonché la quinta città più estesa d'Europa dopo Mosca, Istanbul, Londra e San Pietroburgo. È inoltre il comune europeo con la maggiore superficie di aree verdi[9].""",
          interessi: [
            Interessi.spa
          ]
      ),
      MetaTuristica(
          city: 'Londra',
          country: 'Gran Bretagna',
          rating: 4,
          minPrice: 350,
          maxPrice: 2000,
          available: true,
          raccomanded: true,
          imageUrl: 'http://t0.gstatic.com/licensed-image?q=tbn:ANd9GcTMqjr7j9b4PT5dNY9w-sXvQOQPgcH1b4onB4nrKOq96A5wdI_fwPTvhKQlFSs_',
          description: """Londra, capitale dell'Inghilterra e del Regno Unito, è una città estremamente contemporanea con una storia che risale all'antica Roma. Nel suo centro sorgono l'imponente Palazzo del Parlamento, l'iconica torre dell'orologio nota come Big Ben e l'abbazia di Westminster, dove hanno luogo le incoronazioni dei monarchi britannici. Dall'altra parte del Tamigi, la ruota panoramica London Eye offre la vista spettacolare del distretto culturale del South Bank e dell'intera città.""",
          interessi: [
            Interessi.spa,
          ]
      ),
      MetaTuristica(
          city: 'Los Angeles',
          country: 'Stati Uniti',
          rating: 5,
          minPrice: 600,
          maxPrice: 4000,
          available: true,
          raccomanded: true,
          imageUrl: 'https://cdn.getyourguide.com/img/location/5be37b3c27047.jpeg/88.jpg',
          description: """Los Angeles è un'estesa citta nel sud della California, centro dell'industria televisiva e cinematografica degli Stati Uniti. Vicino al suo iconico cartello "Hollywood", studi di produzione come la Paramount Pictures, la Universal e la Warner Brothers offrono tour "dietro le quinte". Sull'Hollywood Boulevard, il TCL Chinese Theatre espone le impronte delle mani e dei piedi di numerose star, mentre la passerella "Walk of Fame" rende omaggio a migliaia di celebrità con venditori ambulanti che offrono mappe per raggiungere le case delle star. """,
          interessi: [
            Interessi.spa,
            Interessi.mare,
            Interessi.piscina,
          ]
      ),
      MetaTuristica(
          city: 'Dublino',
          country: 'Irlanda',
          rating: 3,
          minPrice: 500,
          maxPrice: 3000,
          available: false,
          raccomanded: true,
          imageUrl: 'http://t3.gstatic.com/licensed-image?q=tbn:ANd9GcR2eXgqV-_bRbmLjpxpCKI7OhjtblDF8WOL4_g7mK2-tOlGHLGRTlUN7JOkkJtf',
          description: """Dublino, capitale della Repubblica d'Irlanda, si trova sulla costa orientale dell'Irlanda, alla foce del fiume Liffey. I suoi edifici storici più importanti sono il castello di Dublino, risalente al XIII secolo, e l’imponente Cattedrale di San Patrizio, fondata nel 1191. I parchi della città comprendono il paesaggistico St. Stephens Green e l’enorme Phoenix Park, all’interno del quale si trova lo Zoo di Dublino. Il Museo nazionale d'Irlanda documenta il patrimonio culturale irlandese.""",
          interessi: [
            Interessi.lago,
            Interessi.bosco,
            Interessi.montagna,
            Interessi.mare
          ]
      ),
      MetaTuristica(
          city: 'Parigi',
          country: 'Francia',
          rating: 3,
          minPrice: 300,
          maxPrice: 6000,
          available: false,
          raccomanded: true,
          imageUrl: 'https://mobilita.org/wp-content/uploads/2021/11/parigi.jpg',
          description: """Noto anche come Quartiere latino, il V arrondissement ospita l'università Sorbona e caffè frequentati da studenti. È noto anche per le librerie, tra cui la famosa Shakespeare & Company. Le attrazioni per famiglie includono il giardino botanico Jardin des Plantes e il Museo Nazionale di Storia Naturale. Il sontuoso edificio del Panthéon ospita i resti di personaggi famosi quali Voltaire e Marie Curie. """,
          interessi: [
            Interessi.piscina,
            Interessi.spa
          ]
      ),
      MetaTuristica(
          city: 'Toronto',
          country: 'Canada',
          rating: 4,
          minPrice: 500,
          maxPrice: 7000,
          available: true,
          raccomanded: false,
          imageUrl: 'http://t2.gstatic.com/licensed-image?q=tbn:ANd9GcR79L6twaO6q5yp34HowT7-NQzpj6CAlKAy-LFFLQ8xAwvHctwUrL9XfWMo0gAg',
          description: """Toronto, capitale della provincia dell'Ontario, è una delle principali città canadesi situata lungo le rive del Lago Ontario. Metropoli dinamica, ha un nucleo di grattacieli svettanti su cui domina l'iconica CN Tower. La città è caratterizzata anche da numerosi spazi verdi, dall'ovale Queen's Park ai 400 acri di High Park, ricco di sentieri, impianti sportivi e zoo.""",
          interessi: [
            Interessi.piscina,
            Interessi.spa,
            Interessi.montagna,
            Interessi.lago,
            Interessi.bosco
          ]
      ),
      MetaTuristica(
          city: 'Barcellona',
          country: 'Spagna',
          rating: 3,
          minPrice: 100,
          maxPrice: 500,
          available: true,
          raccomanded: false,
          imageUrl: 'https://a.cdn-hotels.com/gdcs/production81/d1983/1441d9b5-d0e6-4230-9923-646d58ba66d8.jpg?impolicy=fcrop&w=800&h=533&q=medium',
          description: """Barcellona, la cosmopolita capitale della regione spagnola della Catalogna, è celebre soprattutto per l'arte e l'architettura. La basilica della Sagrada Família e gli altri stravaganti edifici progettati da Antoni Gaudí sono il simbolo della città. Il Museo Picasso e la Fondazione Joan Miró espongono opere d'arte dei due famosi artisti moderni. Il museo di storia cittadina MUHBA raccoglie numerosi reperti archeologici di epoca romana. """,
          interessi: [
            Interessi.piscina,
            Interessi.spa,
            Interessi.mare
          ]
      ),
      MetaTuristica(
          city: 'Praga',
          country: 'Repubblica Ceca',
          rating: 5,
          minPrice: 100,
          maxPrice: 500,
          available: true,
          raccomanded: true,
          imageUrl: 'http://t0.gstatic.com/licensed-image?q=tbn:ANd9GcSVSD6kRNa7yFidOTQRLvcc50OJKw_FW_RcLBgu2zjKLJLUTLWUBL5tTZ3gm4pF',
          description: """Praga, capitale della Repubblica Ceca, è attraversata dal fiume Moldava. Soprannominata "la città dalle cento torri", è nota per la Piazza della Città Vecchia, cuore del nucleo storico, sede di colorati edifici barocchi, chiese gotiche e dell'orologio astronomico medievale, che dà spettacolo allo scoccare di ogni ora. Completato nel 1402, il pedonale Ponte Carlo è fiancheggiato da statue di santi cattolici. """,
          interessi: [
            Interessi.lago
          ]
      ),
      MetaTuristica(
          city: 'Vienna',
          country: 'Austria',
          rating: 3,
          minPrice: 400,
          maxPrice: 1000,
          available: false,
          raccomanded: false,
          imageUrl: 'https://www.eviaggi.info/wp-content/uploads/vienna-turismo.jpg',
          description: """Vienna, la capitale dell'Austria, si trova sulle rive del Danubio, a est del paese. Il suo patrimonio artistico e intellettuale si è formato grazie all'influenza di personalità come Mozart, Beethoven e Sigmunt Freud, che vissero nella città. Vienna è conosciuta anche per i palazzi imperiali come Schönbrunn, la residenza estiva degli Asburgo. L'area del MuseumsQuartier ospita edifici storici e contemporanei dove sono esposte opere di Egon Schiele, Gustav Klimt e altri artisti.""",
          interessi: [
            Interessi.bosco,
            Interessi.spa
          ]
      ),
      MetaTuristica(
          city: 'Peschiera del Garda',
          country: 'Italia',
          rating: 2,
          minPrice: 50,
          maxPrice: 500,
          available: true,
          raccomanded: false,
          imageUrl: 'http://t0.gstatic.com/licensed-image?q=tbn:ANd9GcS4KqrHgR1vwpENTWHBYQjhAHfjj0V8wlwGYIAAhq8gS7Pnji99IuV9LoOcjAVT',
          description: """Peschiera del Garda è un comune italiano di 10 856 abitanti della provincia di Verona in Veneto. È il comune più occidentale della regione e il territorio comunale confina con le province di Brescia e Mantova. """,
          interessi: [
            Interessi.lago
          ]
      ),
      MetaTuristica(
          city: 'Verona',
          country: 'Italia',
          rating: 4,
          minPrice: 100,
          maxPrice: 1000,
          available: true,
          raccomanded: true,
          interessi: null,
          imageUrl: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/colliseum-in-verona-city-italy-royalty-free-image-1640794368.jpg',
          description: """Verona è una città della regione Veneto, nel nord Italia. Il suo centro storico, costruito in un'ansa del fiume Adige, è di epoca medievale. Verona è conosciuta per essere la città di Romeo e Giulietta, i personaggi dell'opera di Shakespeare, e non a caso ospita un edificio del XVI secolo chiamato "la casa di Giulietta", con un delizioso balcone affacciato su un cortile. L'Arena di Verona, grande anfiteatro romano del primo secolo, ospita concerti e opere liriche.""",
      ),
      MetaTuristica(
          city: 'Firenze',
          country: 'Italia',
          rating: 5,
          minPrice: 600,
          maxPrice: 1000,
          available: false,
          raccomanded: true,
          interessi: null,
          imageUrl: 'https://www.italia.it/storage/medium/202104/20210401173629_firenze%20-%20toscana%20-%20gettyimages-1145040590.jpg',
          description: """Firenze, capoluogo della Toscana, ospita molti capolavori dell'arte e dell'architettura rinascimentale. Uno dei luoghi più celebri è il Duomo, la cattedrale con cupola di tegole progettata dal Brunelleschi e il campanile di Giotto. La Galleria dell'Accademia espone la scultura del David di Michelangelo mentre nella Galleria degli Uffizi si trovano La nascita di Venere di Botticelli e l’Annunciazione di Leonardo da Vinci.""",
      ),
    ];
  }
}