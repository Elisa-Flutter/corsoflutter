import 'package:flutter/material.dart';
import 'package:movies/components/cover.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade800,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text('Discover',
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),),
                ),
                Expanded(
                  child: GridView.count(
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      crossAxisCount: 2,
                      children: const [
                        Cover(),
                        Cover(),
                        Cover(),
                        Cover(),
                        Cover(),
                        Cover(),
                        Cover(),
                        Cover(),
                        Cover(),
                        Cover(),
                        Cover(),
                        Cover(),
                      ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}