import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget{
  final bool gridViewOn;
  final Function callback;
  const CustomAppBar({
    required this.gridViewOn,
    required this.callback,
    Key? key
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      leading: IconButton(
        onPressed: () => callback(),
        icon: Icon(gridViewOn ? Icons.list : Icons.grid_view),
      ),
      title: const Text('Folders & Project'),
      actions: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.close),
        ),
      ],
    );
  }
}
