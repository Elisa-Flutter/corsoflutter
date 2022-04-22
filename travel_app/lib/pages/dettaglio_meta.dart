import 'package:flutter/material.dart';
import 'package:travel_app/models/meta_turistica.dart';

class DettaglioMeta extends StatelessWidget {
  final MetaTuristica meta;
  const DettaglioMeta(this.meta, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 300,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://i.pinimg.com/originals/45/dc/35/45dc35f64e14768bd6ade2df0bb9106d.jpg"),
                  ),
                ),
              ),
              Positioned(left: 24, top: 32, child: Icon(Icons.filter_list)),
              Positioned(
                top: 250,
                child: Container(
                  width: 250,
                  height: 200,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
