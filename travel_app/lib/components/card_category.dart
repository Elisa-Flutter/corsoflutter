import 'package:flutter/material.dart';
import 'package:travel_app/models/interessi.dart';

class CardCategory extends StatelessWidget {
  final Interessi? interesse;
  final bool selezionata;
  final bool marginRight;
  final Function(bool) callback;

  //opzionali
  final Color? color;
  final IconData? icon;
  final String? text;

  const CardCategory(this.interesse, this.callback, {this.selezionata = false, this.color, this.icon, this.text, this.marginRight = true, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
          callback(!selezionata);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: marginRight ? const EdgeInsets.only(right: 8) : null,
        decoration: BoxDecoration(
          color: selezionata ? (interesse?.color ?? color) : null,
            border: Border.all(color: Colors.black54),
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: selezionata ? Colors.white : (interesse?.color ?? color),
                  borderRadius:
                  BorderRadius.circular(16)),
              child: Icon(interesse?.icon ?? icon),
            ),
            Text(interesse?.name ?? text ?? '')
          ],
        ),
      ),
    );
  }
}
