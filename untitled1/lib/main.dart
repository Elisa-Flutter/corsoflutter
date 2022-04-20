import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Custom Painter',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyPainter(),
    );
  }
}

class MyPainter extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lines'),),
      body: CustomPaint(
        painter: ShapePainter(),
        //è necessario o il child o la size
        child: Container(),
      ),
    );
  }
}

class ShapePainter extends CustomPainter{
  @override
  //canvas === child del custom paint (se esiste => size = size del child)
  //(0,0) in alto a sx, (size.width, size.height) in basso a dx
  void paint(Canvas canvas, Size size) {
    //tutte le cose relative al colore
    var paint  = Paint()
        ..color = Colors.teal
        ..strokeWidth = 5
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke
    ;

    //LINEA ORIZZONTALE
    //punti di inizio e di fine
    Offset startingPoint  = Offset(0, size.width/2);
    Offset endingPoint  = Offset(size.width, size.width/2);

    //comandi da seguire
    canvas.drawLine(startingPoint, endingPoint, paint);

    //LINEA SPEZZATA
    var path = Path();
    path.moveTo(0, size.height/2);
    path.lineTo(size.width/2, size.height);
    path.lineTo(size.width/2, size.height/2);
    path.lineTo(size.width, size.height/2);
    canvas.drawPath(path, paint);

    //CERCHIO
    Offset center = Offset (size.width/4, size.height/4);
    canvas.drawCircle(center, 50, paint);



  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}