import 'package:flutter/material.dart';
import 'package:social_media/api/api_comment.dart';
import 'package:social_media/models/comment.dart';

class CardComment extends StatefulWidget {
  final Comment comment;
  const CardComment(this.comment, {Key? key}) : super(key: key);

  @override
  State<CardComment> createState() => _CardCommentState();
}

class _CardCommentState extends State<CardComment> {
  late bool _deleted;
  @override
  void initState() {
    super.initState();
    _deleted = false;
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !_deleted,
      child: Card(
        child: Column(
          children: [
            if(widget.comment.owner.picture != null) ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  widget.comment.owner.picture!,
                ),
              ),
              title: Text(widget.comment.owner.firstName),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () async{
                  late bool result;
                  if(widget.comment.id != null) {
                      result = await ApiComment.deleteCommentId(widget.comment.id!);
                    }
                  if(result == true){
                    setState(() {
                      _deleted = true;
                    });
                  }
                  },
              ),
            ),
            Text(widget.comment.message),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
