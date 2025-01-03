import 'package:flutter/material.dart';
import 'package:flutter_turtle/flutter_turtle.dart';

class Cover extends StatefulWidget {
  @override
  _CoverState createState() => _CoverState();
}

class _CoverState extends State<Cover> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ClipRect(
                child: GestureDetector(
                    onTap: () => setState(() {}),
                    child: Container(
                        color: Colors.black87,
                        child: AnimatedTurtleView(
                            animationDuration: Duration(milliseconds: 500),
                            child: Container(
                              height: MediaQuery.of(context).size.height / 2.0,
                              width: double.infinity,
                            ),
                            commands: [
                              PenDown(),
                              SetColor((_) => Colors.white60),
                              Repeat((_) => 36, [
                                Left((_) => 10),
                                Repeat((_) => 360,
                                    [Left((_) => 1), Forward((_) => 3)])
                              ])
                            ])))),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Turtle Graphics in Flutter',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge),
          ),
          Divider(),
          Text('Weizhong Yang a.k.a zonble'),
          Text('zonble@gmail.com'),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
