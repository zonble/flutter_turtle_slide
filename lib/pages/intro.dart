import 'package:flutter/material.dart';
import 'package:flutter_turtle/flutter_turtle.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Text('Turtle Graphics',
                  style: Theme.of(context).textTheme.displayLarge),
              Divider(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              '* Creates graphics with the motion of a turtle.'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              '* Use simple commands like move forward or back, turn left or right, and so on.'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              '* Make complex graphics with repeated commands and recursion.'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              '* What we do here: turn right left and go forward for 100 times.'),
                        ),
                      ],
                    ),
                  ),
                  ClipRect(
                      child: GestureDetector(
                          onTap: () => setState(() {}),
                          child: AnimatedTurtleView(
                              animationDuration: Duration(milliseconds: 1000),
                              child: Container(width: 100, height: 100),
                              commands: [
                                PenDown(),
                                Repeat((_) => 100, [
                                  Left((_) => 60),
                                  Forward((_) => _['repcount'] * 1.0)
                                ])
                              ]))),
                ],
              ),
              Text(''),
            ])));
  }
}
