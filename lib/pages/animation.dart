import 'package:flutter/material.dart';

class AnimationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Animations', style: Theme.of(context).textTheme.display1),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                  Text('- Updates states quickly.'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                  Text('- You can use TweenAnimaionBuilder, AnimatedBuilder, AnimationController...etc'),
                ),

                Divider(),
                Text('''
  @override
  Widget build(BuildContext context) {
    _controller.value = 0;
    _controller.forward();
    return AnimatedBuilder(
        child: widget.child,
        animation: _controller,
        builder: (context, child) {
          var value = _controller.value;
          var instructions =
              _instructions.sublist(0, (_instructions.length * value).toInt());
          return CustomPaint(
            painter: TurtlePainter(instructions),
            size: widget.size,
            isComplex: widget.isComplex,
            child: child,
          );
        });
  }
            ''', style: TextStyle(fontFamily: 'Courier')),
              ],
            ),
          ),
        ));
  }
}
