import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Travel App',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                ),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return 'Inserire un username';
                    }
                    if(value != 'elisa'){
                      return 'Username non valido';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  enableSuggestions: false,
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return 'Inserire la password';
                    }
                    if(value != 'elisa'){
                      return 'Password non valida';
                    }
                    return null;
                  },
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    onPressed: (){
                      if(_formKey.currentState?.validate() ?? false){
                        Navigator.of(context).popAndPushNamed('/home');
                      }
                    },
                    child: const Text('Login')
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
