import 'package:flutter/material.dart';
import '../models/counter.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _Home();
}





class _Home extends State<Home> {
  final MyService _myService = MyService(); 
    void _incrementCounter() {
      setState(() {
        _myService.incrementMyVariable();
      });
    }

    void _decrementCounter() {
      setState(() {
        _myService.decrementMyVariable();
      });
    }

    void _resetCounter() {
      setState(() {
        _myService.resetMyVariable();
      });
    }

  @override 
  Widget build(BuildContext context) {
    return Container(alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Padding(
                  padding: const EdgeInsets.all(10), child : Image.network(
                  "https://midwestmsp.com/wp-content/uploads/2020/11/png-apple-logo-9736.png",
                  height: 50.0,
                  width: 50.0,
                ),
              )
              ),

              const Text(
                'Choisissez un nombre :',
              ),
              Text(
                '${_myService.myVariable}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 10),
              Align(
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton(
                    onPressed: _decrementCounter,
                    child: const Icon(Icons.remove),
                  ),
                  TextButton(
                    onPressed: _resetCounter,
                    child: const Icon(Icons.loop),
                  ),
                  TextButton(
                    onPressed: _incrementCounter,
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
              ),
            ],
          ),
    );
  }
}