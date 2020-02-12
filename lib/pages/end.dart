import 'package:flutter/material.dart';
import 'package:flutter_turtle/flutter_turtle.dart';

class EndPage extends StatefulWidget {
  @override
  _EndPageState createState() => _EndPageState();
}

class _EndPageState extends State<EndPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {}),
      child: AnimatedTurtleView(
        animationDuration: Duration(milliseconds: 250),
        child: Container(width: double.infinity, height: double.infinity),
        commands: [
          Right((_) => 90),
          Repeat((_) => 18, [
            Right((_) => 20),
            Forward((_) => 10),
            SetColor(
                (_) => Colors.black.withOpacity(_['repcount'].toDouble() / 18)),
            SetLabelHeight((_) => _['repcount'] * 2.0 + 20.0),
            Label((_) => 'Thanks'),
            Back((_) => 10),
          ]),
        ],
      ),
    );
  }
}
