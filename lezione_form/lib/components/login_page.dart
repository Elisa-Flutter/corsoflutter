import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  InputDecoration _decoration(String title, bool isPassword) => InputDecoration(
      errorStyle: const TextStyle(color: Colors.yellow),
      focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.yellow)),
      errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.yellow)),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white)),
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white60)),
      focusColor: Colors.white,
      fillColor: Colors.white,
      prefixIconColor: Colors.white60,
      border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white)),
      labelStyle: const TextStyle(color: Colors.white60),
      label: Text(title),
      icon: Icon(
        isPassword ? Icons.vpn_key : Icons.person,
        color: Colors.white60,
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20)
          )
        ),
        backgroundColor: Colors.purple,
        child: SafeArea(
            child: Column(
              children: const [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 40,),
                  ),
                ),
                Text('Login non effettuato', style: TextStyle(color: Colors.yellow),)
              ],
            ),
        ),
      ),
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.purple,
        elevation: 0,
      ),
      body: Container(
        width: double.maxFinite,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.purple, Colors.pink, Colors.red])),
        child: SafeArea(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Bentornato',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w200),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _usernameController,
                        cursorColor: Colors.white,
                        style: const TextStyle(color: Colors.white),
                        decoration: _decoration('Username', false),
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return 'Inserisci un username';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _passwordController,
                        decoration: _decoration('Password', true),
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return 'Inserisci una password';
                          }
                          return null;
                        },
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                        ),
                          onPressed: (){
                            if(_formKey.currentState!.validate()){
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Dati inseriti: user = ${_usernameController.text}, pw = ${_passwordController.text}')),
                              );
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('ACCEDI', style: TextStyle(color: Colors.pink),),
                          )
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
