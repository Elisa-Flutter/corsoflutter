import 'package:flutter/material.dart';
import 'package:social_media/pages/profilo/components/body_profilo.dart';

import '../../api/api_user.dart';
import '../../models/user.dart';

class Profilo extends StatefulWidget {
  final String iduser;
  const Profilo(this.iduser, {Key? key}) : super(key: key);

  @override
  State<Profilo> createState() => _ProfiloState();
}

class _ProfiloState extends State<Profilo> {
  late Future<User> _future;

  Future<User> _fetchUser(String id) async {
    return ApiUser.getDetailsFor(id);
  }

  void initvariabili() {
    _future = _fetchUser(widget.iduser);
  }

  @override
  void initState() {
    initvariabili();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: BodyProfilo(_future));
  }
}
