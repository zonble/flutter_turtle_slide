import 'package:flutter/material.dart';
import 'package:flutter_turtle_slide/pages/history.dart';

import 'pages/agenda.dart';
import 'pages/cover.dart';
import 'pages/end.dart';
import 'pages/intro.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Turtle',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MyHomePage(title: 'Flutter Turtle'),
      );
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var pageController = PageController();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: GestureDetector(
          onTap: () {
            var page = (pageController.page + 1).toInt();
            pageController.animateToPage(page,
                duration: Duration(milliseconds: 250),
                curve: Curves.easeInCubic);
          },
          child: PageView(controller: pageController, children: <Widget>[
            Cover(),
            AgendaPage(),
            IntroPage(),
            HistoryPage(),
            EndPage(),
          ]),
        ),
      );
}
