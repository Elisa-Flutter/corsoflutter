import 'package:flutter/material.dart';
import 'package:ig_giuseppe/components/bio.dart';
import 'package:ig_giuseppe/components/profile_button.dart';
import 'package:ig_giuseppe/components/propic.dart';
import 'package:ig_giuseppe/components/stories_list.dart';
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
            DefaultTabController(
              length: 3,
              child: ListView(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  const TabBar(
                    tabs: [
                      Tab(
                        icon: Icon(Icons.home, color: Colors.black),
                      ),
                      Tab(
                        icon: Icon(Icons.person, color: Colors.black),
                      ),
                      Tab(
                        icon: Icon(Icons.star, color: Colors.black),
                      )
                    ],
                  ),
                  TabBarView(
                    physics: const ClampingScrollPhysics(),
                    children: [
                      GridView.count(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                          //TAB 1
                          crossAxisCount: 3,
                          children: List.generate( 7, (index) =>
                              Container(
                                width: MediaQuery.of(context).size.width/3,
                                height: MediaQuery.of(context).size.width/3,
                                decoration: BoxDecoration(border: Border.all(color: Colors.black), color: Colors.red),
                                  ),
                          ),
                      ),
                      GridView.count(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        //TAB 1
                        crossAxisCount: 3,
                        //TAB 2
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            height: MediaQuery.of(context).size.width / 3,
                            color: Colors.green,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            height: MediaQuery.of(context).size.width / 3,
                            color: Colors.purple,
                          )
                        ],
                      ),
                      GridView.count(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        //TAB 1
                        crossAxisCount: 3,
                        //TAB 3
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            height: MediaQuery.of(context).size.width / 3,
                            color: Colors.amber,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            height: MediaQuery.of(context).size.width / 3,
                            color: Colors.orange,
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
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
