import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:  [
          const CircleAvatar(
            radius: 60,
            backgroundColor: Colors.pink,
          ),
          Align(
            alignment: Alignment.center,
            child: Text('App Social :D',
                style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 40)),
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () async{
                    final sp = await SharedPreferences.getInstance();
                    await sp.setString('loggedUser', '60d0fe4f5311236168a109ca');
                    Navigator.of(context).popAndPushNamed('/home');
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://randomuser.me/api/portraits/women/58.jpg'
                              )
                            ),
                          ),
                        ),
                        const Text('Sara Andersen')
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () async{
                    final sp = await SharedPreferences.getInstance();
                    await sp.setString('loggedUser', '60d0fe4f5311236168a109d0');
                    Navigator.of(context).popAndPushNamed('/home');
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://randomuser.me/api/portraits/med/men/23.jpg'
                              )
                            ),
                          ),
                        ),
                        const Text('Emre Asikoglu')
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
