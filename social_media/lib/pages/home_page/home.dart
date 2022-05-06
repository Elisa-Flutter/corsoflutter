import 'package:flutter/material.dart';
import 'package:social_media/pages/home_page/components/body_home.dart';
import 'package:social_media/components/custom_appbar.dart';
import 'package:social_media/pages/home_page/components/drawer_custom.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: CustomAppBAr(), drawer: DrawerCustom(), body: BodyHome());
  }
}
