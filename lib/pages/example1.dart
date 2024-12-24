import 'package:flutter/material.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';
import 'package:flutter_turtle/flutter_turtle.dart';

class Example1Code extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
              Text('Example', style: Theme.of(context).textTheme.headlineSmall),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Logo:'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    'PD\nSETC 0\nREPEAT 36 [LEFT 10 REPEAT 360 [LEFT 1 FD 3]]',
                    style: TextStyle(fontFamily: 'Courier')),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Flutter:'),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 200,
                      child: SyntaxView(
                        code: ''' 
AnimatedTurtleView(
  animationDuration: Duration(milliseconds: 500),
  child: Container(
    height: double.infinity, width: double.infinity,
  ),
  commands: [
    PenDown(),
    SetColor((_) => Colors.white60),
    Repeat((_) => 36, [
      Left((_) => 10),
      Repeat((_) => 360, [Left((_) => 1), Forward((_) => 3)])
    ])
  ],
),
                  ''',
                        syntax: Syntax.DART,
                        syntaxTheme: SyntaxTheme.dracula(),
                        withZoom: true,
                        withLinesCount: true,
                      )))
            ]))));
  }
}

class Example1 extends StatefulWidget {
  @override
  _Example1State createState() => _Example1State();
}

class _Example1State extends State<Example1> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black87,
        child: GestureDetector(
            onTap: () => setState(() {}),
            child: AnimatedTurtleView(
                animationDuration: Duration(milliseconds: 500),
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                ),
                commands: [
                  PenDown(),
                  SetColor((_) => Colors.white60),
                  Repeat((_) => 36, [
                    Left((_) => 10),
                    Repeat((_) => 360, [Left((_) => 1), Forward((_) => 3)])
                  ])
                ])));
  }
}
