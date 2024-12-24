import 'package:flutter/material.dart';

class ComponentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Text('Components', style: Theme.of(context).textTheme.headlineSmall),
              Divider(),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('* Views'),
                              ),
                              Text('  - TurtleView'),
                              Text('  - AnimatedTurtleView'),
                              Text('  - Turtle Painter'),
                            ])),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('* Turtle DSL'),
                              ),
                              Text('  - Commands'),
                              Text('  - Instructions'),
                              Text('  - Turtle State'),
                              Text('  - Turtle Compiler'),
                            ]))
                  ])
            ])));
  }
}
