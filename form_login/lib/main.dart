import 'package:flutter/material.dart';
import 'package:form_login/components/impostazioni.dart';
import 'package:form_login/components/pagina_1.dart';
import 'package:form_login/components/pagina_2.dart';
import 'package:form_login/components/profilo.dart';
import 'package:form_login/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      initialRoute: '/',
      routes: generateRoutes()

      /*{
        '/': (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
        '/pagina1': (context) => const Pagina1(),
        '/pagina2': (context) => const Pagina2(),
        '/impostazioni': (context) => const Impostazioni(),
        '/profilo': (context) => const Profilo(),
      },*/

      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();

  final _controllerUsername = TextEditingController(text: 'Ciao');
  final _controllerPassword = TextEditingController();
  bool passwordVisibile = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login page'),
      ),

      drawer: Drawer(
        backgroundColor: Colors.yellow,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20)
          ),
        ),

        child: ListView(
          children: [
            DrawerHeader(
                child: Column(
                  children: const [
                    CircleAvatar(
                      child: Text('EC'),
                    ),
                    Text('Benvenuto')
                  ],
                )
            ),
            const ListTile(
              leading: Icon(Icons.home),
              title: Text('Homepage'),
            ),
            ListTile(
              leading: Icon(Icons.style),
              title: Text('Pagina 1'),
              onTap: () => Navigator.of(context).popAndPushNamed('/pagina1'),
            ),
            ListTile(
              leading: Icon(Icons.android),
              title: Text('Pagina 2'),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Pagina2())
              )
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Impostazioni'),
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Impostazioni())
                )
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profilo'),
              onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Profilo())
                )
            ),
          ],
        ),
      ),

      body: Container(
        color: Colors.purple,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Form', style: TextStyle(color: Colors.white, fontSize: 30),),
              Expanded(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      TextFormField(
                        controller: _controllerUsername,
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.person, color: Colors.white60,),
                          labelStyle: TextStyle(color: Colors.white60),
                          errorStyle: TextStyle(
                            color: Colors.yellow
                          ),

                          labelText: 'Username',
                          hintText: 'nome@example.it',


                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 3
                            ),
                          ),

                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.yellow
                            )
                          ),

                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.yellow,
                                  width: 3
                              )
                          ),
                        ),
                        //initialValue: 'Ciao',
                       // keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.white),
                        //autofocus: true,
                        //readOnly: true,
                        //obscuringCharacter: '*',
                        //obscureText: passwordVisibile,
                       // autocorrect: true,
                        validator: (value){
                          //valida se:
                          //  -non è nullo
                          // -non è vuoto
                          // -contiene una @
                          // - contiene un .
                          if(value == null || value.isEmpty){
                            return 'Inserisci una email';
                          }
                          if(!value.contains('@') || !value.contains('.')){
                            return 'Inserisci una email valida';
                          }
                        },
                      ),
                      const SizedBox(height: 20,),
                      TextFormField(
                        controller: _controllerPassword,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          icon: Icon(Icons.vpn_key, color: Colors.white60,),
                          labelStyle: TextStyle(color: Colors.white60),
                          labelText: 'Password',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 3
                            )
                          ),
                        ),
                        //initialValue: 'Ciao',
                       // keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.white),
                        //autofocus: true,
                        //readOnly: true,
                        obscuringCharacter: '*',
                        obscureText: true,
                        autocorrect: false,
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: ElevatedButton(
                          onPressed: () => print('ciao'),
                          child: const Text('Sono un testo'),
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.resolveWith((states)
                              { if(states.contains(MaterialState.pressed)){
                                      return Colors.yellow.shade700;
                                    }
                                    return Colors.yellow;
                                  }
                              )
                          ),
                        ),
                      ),Align(
                        child: ElevatedButton(
                          onPressed: () => print('ciao'),
                          child: const Text('Sono un altro testo'),
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(Colors.red)
                          ),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: (){
                            //?? restituisce il valore di destra nel caso in cui il valore alla sua sinistra sia null
                            //e.g.: se _formKey.currentState == null allora utilizza "false"
                            if(_formKey.currentState?.validate() ?? false) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("L'username è: ${_controllerUsername.text} e la password è: ${_controllerPassword.text}"))
                              );
                            }
                            //_formKey.currentState?.save();
                            //_formKey.currentState?.reset();
                          },
                          child: Text('Salva')
                      ),
                      ElevatedButton(
                          onPressed: (){
                            _formKey.currentState?.reset();
                          },
                          child: Text('Reset'))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
