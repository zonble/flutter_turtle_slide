import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('History', style: Theme.of(context).textTheme.display1),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  '* Turtle Graphics was introduced with Logo programming language since 1967. It has a history about 50 years.'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  '* Logo is an educational programming language. There is a generation start to learn programming from Logo and Turtle Graphics.'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Text('* In 80s, we use on Apple II, Apple II gs, IBM PC...'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Text('* Today, Turtle Graphics libaries are still popular.'),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () => launch(
                    'https://en.wikipedia.org/wiki/Logo_(programming_language)'),
                child: Text(
                  'https://en.wikipedia.org/wiki/Logo_(programming_language)',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () =>
                    launch('https://en.wikipedia.org/wiki/Turtle_graphics'),
                child: Text('https://en.wikipedia.org/wiki/Turtle_graphics',
                    style: TextStyle(color: Colors.blue)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () => launch(
                    'https://archive.org/details/a2gs_LogoWriter_GS_1989_Logo_Computer_Systems'),
                child: Text('LogoWriter GS 1989',
                    style: TextStyle(color: Colors.blue)),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
