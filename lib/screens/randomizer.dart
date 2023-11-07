import 'package:flutter/material.dart';
import '../models/counter.dart';
import 'dart:math';

class Randomizer extends StatefulWidget {
  const Randomizer({Key? key}) : super(key: key);
  @override
  State<Randomizer> createState() => _Randomizer();
}

int random = 0;
int random2 = 0;
List<int> list = List<int>.generate(20, (i) => i + 1);
final MyService _myService = MyService();

class _Randomizer extends State<Randomizer> {
  void _randomNumber() {
    setState(() {
      random = Random().nextInt(_myService.myVariable);
      random2 = Random().nextInt(_myService.myVariable);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Vous avez choisi le nombre : ${_myService.myVariable}',
          ),
          Text(
            '$random + $random2',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          TextButton(
              onPressed: _randomNumber,
              child: const Text('Générer un calcul aléatoire')),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Entrez le resultat du calcul',
              ),
              keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
              onSubmitted: (value) => {
                if (int.parse(value) == random + random2)
                  {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Bravo !'),
                      ),
                    )
                  }
                else
                  {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Raté !'),
                      ),
                    )
                  }
              }
            ),
          ),
        ],
      ),
    );
  }
}
