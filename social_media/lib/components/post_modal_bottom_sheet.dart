import 'package:flutter/material.dart';
import 'package:social_media/api/api_post.dart';
import 'package:social_media/models/post.dart';
import 'package:social_media/models/user.dart';

class PostModalBottomSheet extends StatefulWidget {
  final Post? post;
  final String userId;
  const PostModalBottomSheet(this.userId, {this.post, Key? key}) : super(key: key);

  @override
  State<PostModalBottomSheet> createState() => _PostModalBottomSheetState();
}

class _PostModalBottomSheetState extends State<PostModalBottomSheet> {
  late TextEditingController _controllerText;
  late TextEditingController _controllerTags;

  @override
  void initState() {
    super.initState();
    if(widget.post != null){
      _controllerText = TextEditingController(text: widget.post!.text);
      final String tags = widget.post!.tags?.join(', ') ?? '';
      _controllerTags = TextEditingController(text: tags);
    }
    else {
      _controllerText = TextEditingController();
      _controllerTags = TextEditingController();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 8.0,
        left: 8.0,
        right: 8.0,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: ListView(
        shrinkWrap: true,
        children: [
          TextField(
            controller: _controllerText,
          ),
          TextField(
            controller: _controllerTags,
          ),
          Row(
            children: [
              TextButton(
                  onPressed: (){
                    if(widget.post != null){
                      _controllerText.text = widget.post!.text ?? '';
                      final String tags = widget.post!.tags?.join(', ') ?? '';
                      _controllerTags.text = tags;
                    }
                    Navigator.of(context).pop();
                  },
                  child: const Text('Annulla')
              ),
              TextButton(
                  onPressed: () async{
                    if(_controllerText.text.isNotEmpty){
                      final _newPost = Post(
                          id: widget.post?.id,
                          text: _controllerText.text,
                          tags: _controllerTags.text.split(', '),
                          owner: const User(firstName: 'Elisa', lastName: 'Cattaneo')
                      );
                      if(widget.post != null){
                        ApiPost.editPost(_newPost, widget.userId);
                      } else {
                        ApiPost.addNewPost(_newPost, widget.userId);
                      }
                      Navigator.of(context).pop(true);
                    }
                  },
                  child: widget.post != null ? const Text('Aggiorna') : const Text('Pubblica')
              ),
            ],
          )
        ],
      ),
    );
  }
}
