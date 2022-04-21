import 'package:travel_app/models/interessi.dart';

class MetaTuristica{
  final String city;
  final String country;
  final int rating;
  final int minPrice;
  final int maxPrice;
  final bool available;
  final bool raccomanded;
  final List<Interessi>? interessi;

  const MetaTuristica({
    required this.city,
    required this.country,
    required this.rating,
    required this.minPrice,
    required this.maxPrice,
    required this.available,
    required this.raccomanded,
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
          interessi: [
            Interessi.piscina,
            Interessi.spa
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
          interessi: [
            Interessi.piscina,
            Interessi.spa,
            Interessi.montagna,
            Interessi.lago,
            Interessi.bosco
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
          interessi: null
      ),
      MetaTuristica(
          city: 'Firenze',
          country: 'Italia',
          rating: 5,
          minPrice: 600,
          maxPrice: 1000,
          available: false,
          raccomanded: true,
          interessi: null
      ),
    ];
  }
}