import 'package:flutter/material.dart';

class TabBarViewCustom extends StatefulWidget {
  const TabBarViewCustom({Key? key}) : super(key: key);

  @override
  State<TabBarViewCustom> createState() => _TabBarViewCustomState();
}

class _TabBarViewCustomState extends State<TabBarViewCustom> with SingleTickerProviderStateMixin  {
  late TabController tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      initialIndex: selectedIndex,
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    /*DefaultTabController(
              length: 3,
              child: Column(
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
                  Expanded(
                    child: TabBarView(
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
                    ),
                  )
                ],
              ),
            )*/


    return DefaultTabController(
        length: 3,
        child: Column(
          mainAxisSize: MainAxisSize.min,
            children: [
           TabBar(
             onTap: (int index) {
               setState(() {
                  selectedIndex = index;
                  tabController.animateTo(index);
               });
            },
            controller: tabController,
            tabs: const [
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
              IndexedStack(
                index: selectedIndex,
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
        ]));
  }
}
