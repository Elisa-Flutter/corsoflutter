import 'package:flutter/material.dart';
import 'package:social_media/models/comment.dart';

class CardComment extends StatelessWidget {
  final Comment comment;
  const CardComment(this.comment, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          if(comment.owner.picture != null) ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                comment.owner.picture!,
              ),
            ),
            title: Text(comment.owner.firstName),
          ),
          Text(comment.message),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
