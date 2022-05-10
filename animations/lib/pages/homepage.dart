import 'package:flutter/material.dart';

class Homepage extends StatefulWidget{
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool _big = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              duration: const Duration(seconds: 5),
              opacity: _big ? 1 : 0.5,
              curve: Curves.easeInCubic,
              child: AnimatedContainer(
                width: _big ? 200 : 100,
                height: _big ? 200 : 100,
                color: _big ? Colors.blue : Colors.pink,
                duration: const Duration(seconds: 5),
                curve: Curves.bounceOut,
                child: Image.network("https://i.pinimg.com/originals/7c/b8/65/7cb8657dc92b1d148e0a3f117afd566d.png"),
              ),
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                  _big = !_big;
                });},
                child: const Text('Change')
            ),
          ],
        ),
      ),
    );
  }
}


/*class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool _big = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              duration: const Duration(
                  seconds: 1
              ),
              opacity: _big ? 1 : 0.5,
              child: AnimatedContainer(
                  width: _big ? 250 : 100,
                  color: _big ? Colors.blue : Colors.pink,
                  child: Image.network("https://i.pinimg.com/originals/7c/b8/65/7cb8657dc92b1d148e0a3f117afd566d.png"),
                  duration: const Duration(
                      seconds: 1
                  ),
                curve: Curves.easeInCubic,
              ),
            ),
            TextButton(
                onPressed: (){
                  setState(() {
                  _big = !_big;
                });},
                child: const Text('Change')
            )
          ],
        ),
      ),
    );
  }
}
*/