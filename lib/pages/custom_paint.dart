import 'package:flutter/material.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';

class CustomPaintPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Custom Paint', style: Theme.of(context).textTheme.display1),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('- A widget allow you to do painting'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('- Use a painter within it.'),
            ),
            Divider(),
            Container(
              height: 150,
              child: SyntaxView(
                code: '''
  Widget build(BuildContext context) => CustomPaint(
        painter: TurtlePainter(_instructions),
        size: widget.size,
        isComplex: widget.isComplex,
        child: widget.child,
      );
              ''',
                syntax: Syntax.DART,
                syntaxTheme: SyntaxTheme.dracula(),
                withZoom: true,
                withLinesCount: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
