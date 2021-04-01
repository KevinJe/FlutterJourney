import 'package:flutter/material.dart';
import 'flutter_text.dart';

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
        body: Center(child: FlutterText(str: "捷", style: TextStyle(fontSize: 30),)),
      ),
    );
  }
}