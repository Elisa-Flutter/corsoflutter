import 'package:flutter/material.dart';

class PlaceMainCard extends StatelessWidget {
  final String city;
  final String country;
  final int rating;
  const PlaceMainCard({Key? key, required this.city, required this.country, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24)
      ),
      child: Padding(
        padding:
        const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  city,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.place,
                      color: Colors.blue,
                      size: 14,
                    ),
                    Text(country,
                        style: const TextStyle(
                            fontSize: 14, color: Colors.blue)),
                  ],
                )
              ],
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.directions_bus,
                      color: Colors.green,
                      size: 14,
                    ),
                    Text("2 Days", style: TextStyle(fontSize: 14)),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 14,
                    ),
                    Text("$rating",
                        style: const TextStyle(fontSize: 14)),
                  ],
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.explore,
                      color: Colors.purple,
                      size: 14,
                    ),
                    Text("12 MPH France",
                        style: TextStyle(fontSize: 14)),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );

  }
}