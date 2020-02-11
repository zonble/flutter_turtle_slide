import 'package:flutter/material.dart';

class EndPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            child: Text(
      'Thanks!',
      style: Theme.of(context).textTheme.display1,
    )));
  }
}
