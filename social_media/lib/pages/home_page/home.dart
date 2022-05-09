import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media/components/post_modal_bottom_sheet.dart';
import 'package:social_media/pages/home_page/components/body_home.dart';
import 'package:social_media/components/custom_appbar.dart';
import 'package:social_media/pages/home_page/components/drawer_custom.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Key _scaffoldKey;
  String? _userId;

  initUserId() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      _userId = sp.getString('logKey');
    });
    if (_userId == null) {
      throw Exception('Utente non loggato');
    }
  }

  @override
  void initState() {
    super.initState();
    _scaffoldKey = UniqueKey();
    initUserId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: const CustomAppBAr(),
        drawer: const DrawerCustom(),
        floatingActionButton: _userId != null
            ? FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () async {
               final edited = await showModalBottomSheet(
                    context: context,
                    builder: (context) => PostModalBottomSheet(_userId!));
               if(edited == true){
                 setState(() {
                   _scaffoldKey = UniqueKey();
                 });
               }
              }
              )
            : null,
        body: const BodyHome());
  }
}
