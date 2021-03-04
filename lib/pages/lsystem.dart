import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_turtle/flutter_turtle.dart';
import 'package:url_launcher/url_launcher.dart';

class LSystemPage extends StatefulWidget {
  @override
  _LSystemPageState createState() => _LSystemPageState();
}

class _LSystemPageState extends State<LSystemPage>
    with SingleTickerProviderStateMixin {
  double _value = 10.0;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 10));
    controller.repeat(reverse: true, period: Duration(seconds: 5));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
      AnimatedBuilder(
          animation: controller,
          builder: (context, snapshot) {
            return TurtleView(
              commands: [
                SetMacro('a', [
                  IfElse((_) => _['l'] < 10.0, [
                    Stop()
                  ], [
                    IfElse((_) => _['l'] < 30.0, [
                      SetColor((_) => Colors.green),
                      SetStrokeWidth((_) => 8),
                    ], [
                      SetColor((_) => Colors.brown),
                      SetStrokeWidth((_) => min(_['l'] / 5.0, 50.0)),
                    ]),
                    Back((_) => 4.0),
                    Forward((_) => 4.0),
                    Forward((_) => min(_['l'], 60.0)),
                    Left((_) => 20.0 + (controller.value * 5)),
                    RunMacro('a', (_) => {'l': (_['l'] / 5.0 * 4.0)}),
                    Right((_) => 40.0 - (controller.value * 5)),
                    RunMacro('b', (_) => {'l': (_['l'] / 5.0 * 4.0)}),
                  ]),
                ]),
                SetMacro('b', [
                  IfElse((_) => _['l'] < 10.0, [
                    Stop()
                  ], [
                    IfElse((_) => _['l'] < 30.0, [
                      SetColor((_) => Colors.green),
                      SetStrokeWidth((_) => 8),
                    ], [
                      SetColor((_) => Colors.brown),
                      SetStrokeWidth((_) => min(_['l'] / 5.0, 50.0)),
                    ]),
                    Back((_) => 4.0),
                    Forward((_) => 4.0),
                    Forward((_) => min(_['l'], 60.0)),
                    Right((_) => 20.0 + (controller.value * 10)),
                    RunMacro('a', (_) => {'l': (_['l'] / 5.0 * 4.0)}),
                  ]),
                ]),
                Back((_) => 200),
                PenDown(),
                RunMacro('a', (_) => {'l': _value}),
              ],
              child: Container(width: double.infinity, height: 400),
            );
          }),
      SizedBox(height: 20),
      Container(
        width: 300,
        child: Slider(
          min: 10.0,
          max: 250.0,
          value: _value,
          onChanged: (value) => setState(() => _value = value),
        ),
      ),
      Text('L System'),
      TextButton(
        child: Text('https://en.wikipedia.org/wiki/L-system'),
        style: TextButton.styleFrom(primary: Theme.of(context).primaryColor),
        onPressed: () => launch('https://en.wikipedia.org/wiki/L-system'),
      ),
      TextButton(
        child: Text('FYI: 宇宙的隐秘维度，“分形”神奇的萬物法則|老吳alien'),
        style: TextButton.styleFrom(primary: Theme.of(context).primaryColor),
        onPressed: () => launch('https://www.youtube.com/watch?v=V3d2WlpPBzw'),
      )
    ]));
  }
}
