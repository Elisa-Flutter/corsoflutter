import 'package:flutter/material.dart';

class TweenBuilderCustom extends StatelessWidget{
  const TweenBuilderCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TweenAnimationBuilder<Alignment>(
                tween: AlignmentTween(begin: Alignment.topLeft, end: Alignment.topRight),
                duration: const Duration(seconds: 2),
                curve: Curves.easeInCubic,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.green,
                ),
                builder: (context, tweenValue, tweenChild){
                  return Align(
                    alignment: tweenValue,
                    child: tweenChild
                  );
                }
            ),
            TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.5, end: 1),
                duration: const Duration(seconds: 5),
                curve: Curves.decelerate,
                child: Container(
                  color: Colors.pink,
                ),
                builder: (context, tweenValue, tweenChild){
                  return Opacity(
                    opacity: tweenValue,
                    child: SizedBox(
                      height: tweenValue * 200,
                      width: tweenValue * 200,
                      child: tweenChild
                    ),
                  );
                }
            ),
           TweenAnimationBuilder<TextStyle>(
               tween: TextStyleTween(
                   begin: const TextStyle(
                     fontSize: 50,
                     fontWeight: FontWeight.w200,
                     color: Colors.deepPurple,
                     letterSpacing: 2
                   ),
                 end: const TextStyle(
                   fontSize: 70,
                   fontWeight: FontWeight.w700,
                   color: Colors.orange,
                   letterSpacing: 4
                 )
               ),
               curve: Curves.bounceInOut,
               duration: const Duration(seconds: 2),
               builder: (context, tweenValue, tweenChild){
                 return Text(
                   'Flutter',
                   style: tweenValue,
                 );
               }
           ),
            TweenAnimationBuilder<Color?>(
                tween: ColorTween(begin: Colors.green, end: Colors.brown),
                curve: Curves.slowMiddle,
                duration: const Duration(seconds: 3),
                builder: (context, tweenValue, tweenChild){
                  return Container(
                    width: 100,
                    height: 100,
                    color: tweenValue,
                  );
                }
            )
          ],
        ),
      ),
    );
  }
}
