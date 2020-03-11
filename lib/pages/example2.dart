import 'package:flutter/material.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';
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
                child: Container(
                  height: 300,
                  child: SyntaxView(
                    code: '''
AnimatedTurtleView(
  commands: [
    SetMacro('tree', [
      IfElse((_) => _['l'] < 2.0, [
        Stop()
      ], [
        IfElse((_) => _['l'] < 10.0, [SetColor((_) => Colors.green)],
            [SetColor((_) => Colors.brown)]),
        SetStrokeWidth((_) => _['l'] / 3.0),
        Forward((_) => _['l']),
        Right((_) => 30.0), RunMacro('tree', (_) => {'l': _['l'] * 3.0 / 4.0}),
        Left((_) => 60), RunMacro('tree', (_) => {'l': _['l'] * 3.0 / 4.0}),
      ]),
    ]),
    PenDown(),
    Back((_) => 120),
    SetColor((_) => Colors.brown),
    RunMacro('tree', (_) => {'l': 100.0})
 ],
)
                  ''',
                    syntax: Syntax.DART,
                    syntaxTheme: SyntaxTheme.dracula(),
                    withZoom: true,
                    withLinesCount: true,
                  ),
                ),
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
      child: ClipRect(
        child: Center(
          child: AnimatedTurtleView(
            child: Container(
              width: double.infinity,
              height: double.infinity,
            ),
            commands: [
              SetMacro('tree', [
                IfElse((_) => _['l'] < 10.0, [
                  Stop()
                ], [
                  IfElse((_) => _['l'] < 20.0, [SetColor((_) => Colors.green)],
                      [SetColor((_) => Colors.brown)]),
                  SetStrokeWidth((_) => _['l'] / 3.0),
                  Forward((_) => _['l']),
                  Right((_) => 30.0),
                  RunMacro('tree', (_) => {'l': _['l'] * 4.0 / 5.0}),
                  Left((_) => 60),
                  RunMacro('tree', (_) => {'l': _['l'] * 4.0 / 5.0}),
                ]),
              ]),
              Back((_) => 120),
              PenDown(),
              SetColor((_) => Colors.brown),
              RunMacro('tree', (_) => {'l': 80.0})
            ],
          ),
        ),
      ),
    );
  }
}

class Example22 extends StatefulWidget {
  @override
  _Example22State createState() => _Example22State();
}

class _Example22State extends State<Example22> {
  double _value = 0.0;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 300,
              child: Slider(
                min: -20.0,
                max: 20.0,
                value: _value,
                onChanged: (newValue) => setState(() => _value = newValue),
              ),
            ),
            SizedBox(height: 50),
            TurtleView(
              child: Container(width: double.infinity, height: 400),
              commands: [
                SetMacro('tree', [
                  IfElse((_) => _['l'] < 10.0, [
                    Stop()
                  ], [
                    IfElse(
                        (_) => _['l'] < 20.0,
                        [SetColor((_) => Colors.green)],
                        [SetColor((_) => Colors.brown)]),
                    SetStrokeWidth((_) => _['l'] / 3.0),
                    Forward((_) => _['l']),
                    Right((_) => 30.0 + _value),
                    RunMacro('tree', (_) => {'l': _['l'] * 4.0 / 5.0}),
                    Left((_) => 60 + _value * -1),
                    RunMacro('tree', (_) => {'l': _['l'] * 4.0 / 5.0}),
                  ]),
                ]),
                Back((_) => 120),
                PenDown(),
                SetColor((_) => Colors.brown),
                RunMacro('tree', (_) => {'l': 80.0})
              ],
            ),
          ],
        ),
      ),
    );
  }
}
