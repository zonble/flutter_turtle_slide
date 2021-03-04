import 'package:flutter/material.dart';

class AgendaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Agenda',
              style: Theme.of(context).textTheme.headline4,
            ),
            Divider(),
            Text('* What is Turtle Graphics?'),
            SizedBox(height: 4),
            Text('* I made a Turtle Graphics library on Flutter'),
            SizedBox(height: 4),
            Text('* What enabled me to make the library?'),
            SizedBox(height: 4),
            Text('  - EDSL (Embeded Domain Specific Language)'),
            Text('  - Custom Paint'),
            Text('  - Animations in Flutter'),
          ],
        ),
      ),
    );
  }
}
