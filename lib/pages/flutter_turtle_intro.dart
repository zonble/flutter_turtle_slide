import 'package:flutter/material.dart';

class FlutterTurtleIntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Text('Flutter Turtle',
                  style: Theme.of(context).textTheme.displayLarge),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    Text('* I made it during the New Year holidays in 2020.'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('* Because no one did it for Flutter'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('* And it is fun!'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    '* Just add `flutter_turtle` to your pubsepc.yml file.'),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '* import \'package:flutter_turtle/flutter_turtle.dart\';',
                    style: TextStyle(fontFamily: 'Courier'),
                  ))
            ])));
  }
}
