import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:social_media/models/post.dart';

class CardPost extends StatelessWidget {
  final Post post;

  const CardPost({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*if(post.publishDate != null){
      //trasformazione da String a DateTime
      final _data = DateTime.parse(post.publishDate!);
      print(
        //trasformazione da DateTime a String formattata come voglio
          DateFormat('d/M/y H:m').format(_data));
    }*/

    return GestureDetector(
      onTap: () async {
        final _refresh = await Navigator.of(context).pushNamed('/profile');
        if (_refresh == true){
          print('AO ME SO REFRESHATO!!');
        }
      },
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 16, 8),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        //post.owner.url == null ? "https://via.placeholder.com/150" : post.owner.url!
                          post.owner.picture ?? "https://via.placeholder.com/150"
                      ),
                      radius: 30,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text( "${post.owner.firstName} ${post.owner.lastName}",
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(post.publishDate ?? ''),
                    ],
                  ),
                ],
              ),
              Text(
                post.text ?? '',
              ),
              if(post.image != null) Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Image.network(
                  post.image!,
                  width: MediaQuery.of(context).size.width - 16,
                ),
              ),
              Wrap(
                spacing: 8,
                children: [
                  Chip(
                    label: Text("animal"),
                  ),
                  Chip(
                    label: Text("animal"),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(post.likes.toString()),
                  const Icon(Icons.favorite),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}