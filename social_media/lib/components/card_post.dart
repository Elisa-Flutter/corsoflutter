import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media/api/api_post.dart';
import 'package:social_media/components/button_like.dart';
import 'package:social_media/components/post_modal_bottom_sheet.dart';
import 'package:social_media/models/post.dart';
import 'package:social_media/pages/Post_page/post_page.dart';
import 'package:social_media/pages/profilo/profilo.dart';

class CardPost extends StatefulWidget {
  final String userIdLoggato;
  final Post post;
  final bool profilo;
  final VoidCallback callback;
  const CardPost(this.userIdLoggato, {required this.post, required this.callback, this.profilo = false, Key? key})
      : super(key: key);

  @override
  State<CardPost> createState() => _CardPostState();
}

class _CardPostState extends State<CardPost> {
  bool _deleted = false;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !_deleted,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 6,
        margin: const EdgeInsets.all(20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Padding(
            padding: const EdgeInsets.all(4),
            child: InkWell(
              onTap: (() {
                if (widget.profilo == false) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Profilo(widget.post.owner.id ?? "user not found");
                  }));
                }
              }),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                  widget.post.owner.picture != null ? NetworkImage(widget.post.owner.picture!) : null,
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${widget.post.owner.firstName} ${widget.post.owner.lastName}'),
                    Visibility(
                        visible: widget.post.owner.id == widget.userIdLoggato,
                        child: TextButton(
                            child: const Text('Modifica'),
                            onPressed: () async {
                                final changed = await showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context)
                                      => PostModalBottomSheet(widget.userIdLoggato, post: widget.post)
                                );
                                if(changed == true){
                                  widget.callback();
                                }
                            },
                        )
                    )
                  ],
                ),
              ),
            ),
          ),
          Row(
            children: [
              if(widget.post.publishDate != null) Text(
                DateFormat.yMMMMd('it_IT').add_Hm().format(
                      DateTime.parse(widget.post.publishDate!),
                    ),
                textAlign: TextAlign.end,
                style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                    fontWeight: FontWeight.normal),
              ),
              TextButton(
                  onPressed: () async{
                    late bool visible;
                    if(widget.post.id != null){
                      visible = await ApiPost.deletePost(widget.post.id!);
                    }
                    if(visible && !_deleted){
                      setState(() {
                        _deleted = true;
                      });
                    }
                  },
                  child: const Text('Elimina')
              )
            ],
          ),
          if(widget.post.text != null) Text(widget.post.text!),
          if(widget.post.image != null && widget.post.image!.isNotEmpty) Image.network(widget.post.image!),
          if(widget.post.tags != null) Wrap(
              children: widget.post.tags!
                  .map((item) => Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Chip(label: Text(item)),
                      ))
                  .toList()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                LikeButton(widget.post, widget.userIdLoggato),
                TextButton.icon(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return PostPage(widget.post, callback: widget.callback,);
                    }));
                  },
                  icon: const Icon(Icons.comment_bank_outlined),
                  label: const Text(""),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
