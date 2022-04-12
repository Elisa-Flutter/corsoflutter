import 'dart:io';

import 'package:flutter/material.dart';

class CardMenu extends StatefulWidget {
  final IconData icona;
  final String titolo;
  final int numeroPlaces;
  const CardMenu({
    required this.icona,
    required this.titolo,
    required this.numeroPlaces,
    Key? key
  }) : super(key: key);

  @override
  State<CardMenu> createState() => _CardMenuState();
}

class _CardMenuState extends State<CardMenu> {
  late bool _attiva;

  @override
  void initState() {
    super.initState();
    _attiva = false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: SizedBox(
        height: 200,
        child: GestureDetector(
          onTap: () {
            setState(() {
              _attiva = !_attiva;
            });
          },
          child: Card(

            /*
              _attiva ? Colors.black12 : Colors.yellow
            * if(_attiva){
                    Colors.black12;
               } else {
               Colors.yellow
               }
            * */
            color: _attiva ? Colors.yellow : Colors.black12,
            child: AspectRatio(
              aspectRatio: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('pizza.png'),
                  const SizedBox(height: 16),
                  Text(widget.titolo,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text('${widget.numeroPlaces} Place',
                    style: const TextStyle(color: Colors.white60),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
