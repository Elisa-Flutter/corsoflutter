import 'package:flutter/material.dart';

class TweenPage extends StatefulWidget {
  const TweenPage({Key? key}) : super(key: key);

  @override
  State<TweenPage> createState() => _TweenPageState();
}

class _TweenPageState extends State<TweenPage> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<double> _animationSize;
  late Animation<Color?> _animationColor;
  late Animation<double> _animationRotation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 5),
    );

    _animationSize = Tween<double>(begin: 200, end: 300).animate(CurvedAnimation(parent: _animationController, curve: Curves.bounceInOut));
    _animationColor = ColorTween(begin: Colors.pink, end: Colors.deepPurple).animate(CurvedAnimation(parent: _animationController, curve: Curves.bounceInOut));
    _animationRotation = Tween<double>(begin: 0, end: 1).animate(_animationController);

    _animationController.addListener(() {
      setState(() {});
    });

    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RotationTransition(
          turns: _animationRotation,
          child: Container(
            width: _animationSize.value,
            height: _animationSize.value,
            color: _animationColor.value,
          ),
        ),
      ),
    );
  }
}

/*
class TweenPage extends StatefulWidget {
  const TweenPage({Key? key}) : super(key: key);

  @override
  State<TweenPage> createState() => _TweenPageState();
}

class _TweenPageState extends State<TweenPage> with SingleTickerProviderStateMixin{
  late Animation<double> _animation;
  late AnimationController _animationController;
  late Animation _colorAnimation;
  late Animation<double> _animationRotation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _animation = Tween<double>(begin: 200, end: 300).animate(_animationController);
    _colorAnimation = ColorTween(begin: Colors.pink, end: Colors.green).animate(_animationController);

    _rotationAnimation = Tween(begin: 0.0, end: 1.0).animate(_animationController);


    _animationController.addListener(() {setState(() {
    });});

    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RotationTransition(
          turns: _rotationAnimation,
          child: Container(
            color: _colorAnimation.value,
            width: _animation.value,
            height: _animation.value,
          ),
        ),
      ),
    );
  }
}
*/
