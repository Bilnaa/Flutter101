import 'package:flutter/material.dart';

class ParamBody extends StatefulWidget {
  const ParamBody({Key? key}) : super(key: key);

  @override
  State<ParamBody> createState() => _ParamBody();
}


class _ParamBody extends State<ParamBody> {
    @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).colorScheme.background,
        alignment: Alignment.center,
        child: const Text('Paramètres'),
      );
  }
}
