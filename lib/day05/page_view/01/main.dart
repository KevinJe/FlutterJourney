import 'package:flutter/material.dart';
import 'pageview_simple.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(),
        body: Container(
          child: PageViewSimple(),
        ),
      ),
    );
  }
}
