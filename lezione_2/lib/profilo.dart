import 'package:flutter/material.dart';

class Profilo extends StatelessWidget {
  const Profilo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profilo'),
      ),
      body: const Center(
        child: Text('Elisa Cattaneo'),
      ),
    );
  }
}
