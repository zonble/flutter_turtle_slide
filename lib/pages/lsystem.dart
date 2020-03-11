import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_turtle/flutter_turtle.dart';
import 'package:url_launcher/url_launcher.dart';

class LSystemPage extends StatefulWidget {
  @override
  _LSystemPageState createState() => _LSystemPageState();
}

class _LSystemPageState extends State<LSystemPage> {
  double _value = 20.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TurtleView(
            commands: [
              SetMacro('a', [
                IfElse((_) => _['l'] < 10.0, [
                  Stop()
                ], [
                  IfElse((_) => _['l'] < 30.0, [SetColor((_) => Colors.green)],
                      [SetColor((_) => Colors.brown)]),
                  SetStrokeWidth((_) => min(_['l'] / 5.0, 50.0)),
                  Forward((_) => min(_['l'], 60.0)),
                  Left((_) => 20.0),
                  RunMacro('a', (_) => {'l': (_['l'] / 5.0 * 4.0)}),
                  Right((_) => 40.0),
                  RunMacro('b', (_) => {'l': (_['l'] / 5.0 * 4.0)}),
                ]),
              ]),
              SetMacro('b', [
                IfElse((_) => _['l'] < 10.0, [
                  Stop()
                ], [
                  IfElse((_) => _['l'] < 30.0, [SetColor((_) => Colors.green)],
                      [SetColor((_) => Colors.brown)]),
                  SetStrokeWidth((_) => min(_['l'] / 5.0, 50.0)),
                  Forward((_) => min(_['l'], 60.0)),
                  Right((_) => 10.0),
                  RunMacro('a', (_) => {'l': (_['l'] / 5.0 * 4.0)}),
                ]),
              ]),
              Back((_) => 200),
              PenDown(),
              RunMacro('a', (_) => {'l': _value}),
            ],
            child: Container(width: double.infinity, height: 400),
          ),
          SizedBox(height: 50),
          Text('L System'),
          FlatButton(
            child: Text('https://en.wikipedia.org/wiki/L-system'),
            textColor: Theme.of(context).primaryColor,
            onPressed: () => launch('https://en.wikipedia.org/wiki/L-system'),
          ),
          Container(
            width: 300,
            child: Slider(
              min: 20.0,
              max: 300.0,
              value: _value,
              onChanged: (value) => setState(() => _value = value),
            ),
          ),
        ],
      ),
    );
  }
}
