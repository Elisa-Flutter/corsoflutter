import 'package:flutter/material.dart';
import 'package:travel_app/models/interessi.dart';

class CardCategory extends StatefulWidget {
  final Interessi? interesse;
  final bool marginRight;

  //opzionali
  final Color? color;
  final IconData? icon;
  final String? text;

  const CardCategory(this.interesse, {this.color, this.icon, this.text, this.marginRight = true, Key? key}) : super(key: key);

  @override
  State<CardCategory> createState() => _CardCategoryState();
}

class _CardCategoryState extends State<CardCategory> {
  late bool selezionato;

  @override
  void initState() {
    super.initState();
    selezionato = false;
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          selezionato = !selezionato;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: widget.marginRight ? const EdgeInsets.only(right: 8) : null,
        decoration: BoxDecoration(
          color: selezionato ? (widget.interesse?.color ?? widget.color) : null,
            border: Border.all(color: Colors.black54),
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color:selezionato ? Colors.white : (widget.interesse?.color ?? widget.color),
                  borderRadius:
                  BorderRadius.circular(16)),
              child: Icon(widget.interesse?.icon ?? widget.icon),
            ),
            Text(widget.interesse?.name ?? widget.text ?? '')
          ],
        ),
      ),
    );
  }
}
