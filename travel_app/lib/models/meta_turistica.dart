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
}