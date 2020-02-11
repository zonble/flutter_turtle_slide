import 'package:flutter/material.dart';

class DSLExplainedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Implementation of Turtle DSL ',
                style: Theme.of(context).textTheme.display1),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  '* Commands are classes implementing the same abstract class.'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Text('* "Turtle DSL" code are made with array of objects.'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  '* A simple compiler compiles "Turtle DSL" code into drawing commands.'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  '* "TurtleView" uses CustomPaint to draw the drawing commands.'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  '* "AnimaatedTurtleView" uses CustomPaint to draw the drawing commands repeatedly overtime.'),
            ),
          ],
        ),
      ),
    );
  }
}
