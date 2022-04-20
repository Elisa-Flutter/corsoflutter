import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  final String? buttonLabel;
  final bool hasIcon;
  const ProfileButton({Key? key, this.buttonLabel, required this.hasIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            if(buttonLabel!= null) Text(
              buttonLabel!,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            if(hasIcon) const Icon(Icons.expand_more, color: Colors.black, size: 16,),
          ],
        ),
      ),
    );
  }
}
