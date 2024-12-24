import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TodayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
            Text('Turtle Graphics Today',
                style: Theme.of(context).textTheme.displayLarge),
            Divider(),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () => launch('https://goplay.space/#draw'),
                  child: Text('Go Playground Turtle Graphics Mode',
                      style: TextStyle(color: Colors.blue)),
                )),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () =>
                      launch('https://docs.python.org/3/library/turtle.html'),
                  child: Text('Turtle Graphics for Python 3',
                      style: TextStyle(color: Colors.blue)),
                )),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () => launch('https://www.calormen.com/jslogo/'),
                  child: Text('Online Logo Interpreter',
                      style: TextStyle(color: Colors.blue)),
                )),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () => launch(
                      'https://fog.ccsf.edu/~cpersiko/cs110a/NotesTurtleIntro.html'),
                  child:
                      Text('CCSF CS110', style: TextStyle(color: Colors.blue)),
                )),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () => launch(
                      'http://personal.denison.edu/~bressoud/cs110-s12/lab03/lab03.htm'),
                  child: Text('Denison Univerity CS110',
                      style: TextStyle(color: Colors.blue)),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                  onTap: () =>
                      launch('https://personal.utdallas.edu/~veerasam/logo/'),
                  child: Text('The Univerty Texas at Dallas - LOGO Workshop',
                      style: TextStyle(color: Colors.blue))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('...'),
            )
          ])));
}
