import 'package:flutter/material.dart';

class Cover extends StatelessWidget {
  const Cover({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Jumanji 2'),
            content: const SingleChildScrollView(
              child:  Text("""
Nel 2019, tre anni dopo la loro avventura nel gioco Jumanji, Spencer Gilpin, Anthony Johnson, Martha Kaply e Bethany Walker conducono vite migliori. Dopo essersi separati per seguire la propria strada, il gruppo decide di organizzare un brunch di riunione a Brantford, sebbene Spencer sia preoccupato per l'incontro, poiché lui e Martha si sono presi una pausa. Durante la sua prima notte a Brantford, comincia a considerare il tempo passato all'interno di Jumanji come ciò che gli ha dato un reale scopo e riflette sul voler tornare dentro al gioco. Il giorno seguente, i suoi amici, preoccupati della sua assenza, vanno a casa sua e lì incontrando il nonno di Spencer, Eddie, che si sta riprendendo dall'operazione chirurgica all'anca e l'ex amico di Eddie, Milo Walker, che gli sta facendo visita per un motivo sconosciuto.
Il gruppo setaccia la casa e scopre che Spencer ha deliberatamente tenuto e riparato i pezzi rotti della cartuccia Jumanji. Sospettando che sia rientrato nel gioco, i suoi amici decidono di seguirlo. Tuttavia, la cartuccia non funziona correttamente, risucchiando Anthony e Martha, insieme con Eddie e Milo, ma non Bethany, costringendola a contattare il giocatore di Jumanji Alex Vreeke, loro vecchio amico, per chiedere aiuto. All'interno del gioco, Martha si ritrova insieme con il suo avatar Ruby Roundhouse, tuttavia Anthony finisce a impersonare l'avatar di Bethany, il professor Sheldon Oberon, mentre Eddie diventa l'avatar di Spencer, il Dr. Smolder Bravestone, e Milo diventa l'avatar di Anthony, Franklin "Topo" Finbar. Dopo che a Eddie e Milo sono state spiegate le regole del gioco, il gruppo incomincia a cercare Spencer e il suo avatar, tuttavia esso incontra il personaggio non giocante Nigel Billingsley, che li informa che il gioco è cambiato dopo il suo ultimo utilizzo.
"""),
            ),
            actions: [
              TextButton(
                  onPressed: ()=>Navigator.of(context).pop(),
                  child: const Text('Esci')
              )
            ],
              )
      ),
      child: AspectRatio(aspectRatio: 1,
        child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                          'assets/jumanji.jpeg'
                      )
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black,
                        Colors.transparent
                      ]
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Jumanji 2',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    ActionChip(
                      onPressed: () => ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text('La valutazione è di 6/10 stelle su MyMovies'),)),
                      backgroundColor: Colors.red,
                      label: const Text('6.0', style: TextStyle(
                        color: Colors.white,),
                      ),
                      avatar: const Icon(Icons.star_border),
                    ),
                  ],
                ),
              )
            ]
        ),),
    );
  }
}
