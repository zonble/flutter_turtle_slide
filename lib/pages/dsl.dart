import 'package:flutter/material.dart';

class DSLPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Why a DSL?', style: Theme.of(context).textTheme.display1),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('- You are still coding in Dart not in Logo.'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('- Making a Logo interpreter does takes time.'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  '- I want to reuse as much of Dart/Flutter as possible.'),
            ),
            Text('    * Math'),
            Text('    * Color system'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  '- Possible to embed into Flutter apps.'),
            ),
          ],
        ),
      ),
    );
  }
}
