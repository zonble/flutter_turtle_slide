import 'package:flutter/material.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';

class PainterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
              Text('Painter', style: Theme.of(context).textTheme.displayLarge),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('- You can use Canvas, Paint and TextPainter here'),
              ),
              Divider(),
              Container(
                  height: 300,
                  child: SyntaxView(
                    code: '''
class TurtlePainter extends CustomPainter {
  final List<Instruction> commands;

  TurtlePainter(this.commands);

  @override
  void paint(Canvas canvas, Size size) {
    var turtle = TurtleState();
    var context = PaintContext()
      ..canvas = canvas
      ..paint = (Paint()
        ..color = turtle.color
        ..strokeWidth = turtle.strokeWidth)
      ..center = Offset(size.width / 2, size.height / 2);
    commands.forEach((command) => command.exec(context));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

            ''',
                    syntax: Syntax.DART,
                    syntaxTheme: SyntaxTheme.dracula(),
                    withZoom: true,
                    withLinesCount: true,
                  ))
            ]))));
  }
}
