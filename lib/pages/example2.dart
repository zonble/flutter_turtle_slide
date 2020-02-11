import 'package:flutter/material.dart';
import 'package:flutter_turtle/flutter_turtle.dart';

class Example2Code extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Example', style: Theme.of(context).textTheme.display1),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(''' 
AnimatedTurtleView(
  commands: [
    SetMacro('tree', [
      IfElse((_) => _['l'] < 5.0, [
      Stop()
      ], [
        SetStrokeWidth((_) => _['l'] / 3.0),
        Forward((_) => _['l']),
        Right((_) => 30.0),
        Forward((_) => _['l'] / 2.0),
        RunMacro('tree', (_) => {'l': _['l'] * 3.0 / 4.0}),
        Back((_) => _['l'] / 2.0),
        Left((_) => 60),
        Forward((_) => _['l'] / 2.0),
        RunMacro('tree', (_) => {'l': _['l'] * 3.0 / 4.0}),
        Back((_) => _['l'] / 2.0),
      ]),
    ]),
    Back((_) => 120),
    PenDown(),
    RunMacro('tree', (_) => {'l':60.0})
 ],
)
                ''', style: TextStyle(fontFamily: 'Courier')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Example2 extends StatefulWidget {
  @override
  _Example2State createState() => _Example2State();
}

class _Example2State extends State<Example2> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {}),
      child: AnimatedTurtleView(
        commands: [
          SetMacro('tree', [
            IfElse((_) => _['l'] < 2.0, [
              Stop()
            ], [
              IfElse((_) => _['l'] < 10.0, [SetColor((_) => Colors.green)],
                  [SetColor((_) => Colors.brown)]),
              SetStrokeWidth((_) => _['l'] / 3.0),
              PenDown(),
              Forward((_) => _['l']),
              Right((_) => 30.0),
              Forward((_) => _['l'] / 2.0),
              RunMacro('tree', (_) => {'l': _['l'] * 3.0 / 4.0}),
              PenUp(),
              Back((_) => _['l'] / 2.0),
              PenDown(),
              Left((_) => 60),
              Forward((_) => _['l'] / 2.0),
              RunMacro('tree', (_) => {'l': _['l'] * 3.0 / 4.0}),
              Back((_) => _['l'] / 2.0),
            ]),
          ]),
          Back((_) => 120),
          SetColor((_) => Colors.brown),
          RunMacro('tree', (_) => {'l': 60.0})
        ],
      ),
    );
  }
}
