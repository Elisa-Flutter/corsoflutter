import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  int index = 0;

  void selectItemWithIndex(int i) {
    setState(() {
      index = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      height: 200,
      width: double.infinity,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: Icon(
                Icons.person,
                size: 40,
                color: Colors.white
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              // (condizione1 && condizione2 || condizione3)
              //      ? (se vero)
              //      : (se falso);

              /* if(condizione1 && condizione2 || condizione3){
                    (fai qualcosa se vero)
                  } else {
                    (fai qualcosa se falso)
                  }
               */

              TextButton(
                  onPressed: () {
                    selectItemWithIndex(0);
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(
                      action: SnackBarAction(
                        label: 'Annulla',
                        onPressed: ()=>print('ho premuto l\'azione'),
                      ),
                        duration: Duration(seconds: 5),
                        content: Text('Messaggio inviato')));
                  },
                  child: Text('HOME',
                    style: TextStyle(
                        fontSize: 16,
                        color: index == 0 ? Colors.white : Colors.white54,
                        fontWeight: FontWeight.bold
                    ),
                  ),
              ),
              TextButton(
                  onPressed:  () {
                    selectItemWithIndex(1);
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Eliminazione foto'),
                        content: Text('Sei sicuro di voler continuare?'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                print('Sì');
                                Navigator.of(context).pop();
                              },
                              child: Text('Sì')
                          ),
                          TextButton(
                              onPressed: () => print('Annulla'),
                              child: Text('Annulla')
                          ),
                        ],
                      )
                  );
                },
                child: Text('CONTATTI',
                  style: TextStyle(
                      fontSize: 16,
                      color: index == 1 ? Colors.white : Colors.white54,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              TextButton(
                onPressed: () => selectItemWithIndex(2),
                child: Text('PROFILO',
                  style: TextStyle(
                      fontSize: 16,
                      color: index == 2 ? Colors.white : Colors.white54,
                      fontWeight: FontWeight.bold
                  ),),
              )
            ],
          )
        ],
      ),
    );
  }
}
