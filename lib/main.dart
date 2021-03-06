import 'dart:math';

import 'package:flutter/material.dart';

import 'pages/agenda.dart';
import 'pages/animation.dart';
import 'pages/components.dart';
import 'pages/cover.dart';
import 'pages/custom_paint.dart';
import 'pages/dsl.dart';
import 'pages/dsl_explained.dart';
import 'pages/end.dart';
import 'pages/example1.dart';
import 'pages/example2.dart';
import 'pages/flutter_turtle_intro.dart';
import 'pages/history.dart';
import 'pages/intro.dart';
import 'pages/lsystem.dart';
import 'pages/painter.dart';
import 'pages/today.dart';

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
  PageController _pageController = PageController();
  GlobalKey<_PageNumberState> _key = GlobalKey();
  int _page = 1;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      var currentPage = _pageController.page.toInt() + 1;
      _page = currentPage;
      _key.currentState.setPage(_page);
    });
  }

  void nextPage() {
    if (!_pageController.hasClients) return;
    var page = (_pageController.page + 1).toInt();
    _pageController.animateToPage(page,
        duration: Duration(milliseconds: 250), curve: Curves.easeInCubic);
  }

  void previousPage() {
    if (!_pageController.hasClients) return;
    var page = max(0, (_pageController.page - 1).toInt());
    _pageController.animateToPage(page,
        duration: Duration(milliseconds: 250), curve: Curves.easeInCubic);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 1024, maxHeight: 768),
            child: GestureDetector(
              onTap: nextPage,
              child: Stack(
                children: <Widget>[
                  PageView(controller: _pageController, children: <Widget>[
                    Cover(),
                    AgendaPage(),
                    IntroPage(),
                    HistoryPage(),
                    TodayPage(),
                    FlutterTurtleIntroPage(),
                    Example1Code(),
                    Example1(),
                    Example2Code(),
                    Example2(),
                    Example22(),
                    LSystemPage(),
                    ComponentsPage(),
                    DSLPage(),
                    DSLExplainedPage(),
                    CustomPaintPage(),
                    PainterPage(),
                    AnimationPage(),
                    EndPage(),
                  ]),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                              icon: Icon(Icons.arrow_left, color: Colors.grey),
                              onPressed: previousPage),
                          PageNumber(key: _key, page: _page),
                          IconButton(
                              icon: Icon(Icons.arrow_right, color: Colors.grey),
                              onPressed: nextPage),
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PageNumber extends StatefulWidget {
  const PageNumber({
    Key key,
    @required int page,
  })  : initialPage = page,
        super(key: key);

  final int initialPage;

  @override
  _PageNumberState createState() => _PageNumberState();
}

class _PageNumberState extends State<PageNumber> {
  int _page;

  @override
  void initState() {
    super.initState();
    _page = widget.initialPage;
  }

  void setPage(int pageIndex) {
    setState(() => _page = pageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        child: Center(
            child: Text(
          'Page: $_page',
          style: TextStyle(color: Colors.grey),
        )));
  }
}
