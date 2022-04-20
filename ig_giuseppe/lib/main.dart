import 'package:flutter/material.dart';
import 'package:ig_giuseppe/components/bio.dart';
import 'package:ig_giuseppe/components/profile_button.dart';
import 'package:ig_giuseppe/components/propic.dart';
import 'package:ig_giuseppe/components/stories_list.dart';
import 'package:ig_giuseppe/components/tab_bar_view.dart';
import 'package:ig_giuseppe/components/user_data.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'Instagram Profile'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.chevron_left,
          size: 28,
          color: Colors.black,
        ),
        title: const Text(
          'LoremIpsum',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(
              Icons.more_horiz,
              size: 28,
              color: Colors.black,
            ),
          )
        ],
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          //Elementi della pagina
          children: [
            // AVATAR + STATS
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              child: Row(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Propic(),
                  Expanded(
                    // User Stats
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const UserData(dataNumber: '135', dataLabel: 'Posts'),
                        const UserData(
                            dataNumber: '16K', dataLabel: 'Followers'),
                        GestureDetector(
                          //Following list
                          child: const UserData(
                              dataNumber: '122', dataLabel: 'Following'),
                          onTap: () => showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: SizedBox(
                                height: 300,
                                width: double.maxFinite,
                                child: ListView(
                                  shrinkWrap: true,
                                  children: const [
                                    ListTile(
                                      leading: Icon(Icons.face),
                                      title: Text('Mario Rossi'),
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.face),
                                      title: Text('Luigi Verdi'),
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.face),
                                      title: Text('Peach Rosa'),
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.face),
                                      title: Text('Toad Blu'),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ), //Following list end
                      ],
                    ),
                  ) //User Stats end
                ],
              ),
            ),

            //BIO
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              child: Bio(
                name: 'Lorem Ipsum',
                profession: 'Public figure',
                biography: 'Your bio goes here...\nand here too.',
                link: 'loremipsum.com',
              ),
            ),

            //PULSANTI
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: const ProfileButton(
                      buttonLabel: 'Following',
                      hasIcon: true,
                    ),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Stai seguendo Lorem Ipsum'),
                        ),
                      );
                    },
                  ),
                  const ProfileButton(buttonLabel: 'Message', hasIcon: false),
                  const ProfileButton(buttonLabel: 'Contact', hasIcon: false),
                  const ProfileButton(hasIcon: true),
                ],
              ),
            ),

            //STORIE
            const StoriesList(labelList: [
              'Home',
              'Travel',
              'Food',
              'LifeStyle',
              'Friends',
              'Stuff'
            ]),

            //TAB
            const TabBarViewCustom()

          ],
        ),
      ),

      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Icon(Icons.home),
          Icon(Icons.search),
          Icon(Icons.add),
          Icon(Icons.favorite),
          Icon(Icons.person)
        ],
      ),
    );
  }
}
