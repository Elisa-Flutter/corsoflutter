import 'package:flutter/material.dart';

class CustomFab extends StatelessWidget {
  final Function callback;
  const CustomFab(this.callback, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => callback(),
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
