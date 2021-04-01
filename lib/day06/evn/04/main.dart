import 'package:flutter/material.dart';
import 'package:flutter_journey/day06/evn/03/flutter_container.dart';
import 'flutter_text.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        body: Center(
          child: FlutterText("代码，改变生活",
            config: AnimConfig(
              mode: FlutterMode.up_down,
              duration: 1000,
              offset: 18,
              curve: Curves.linear
            ),
            style: TextStyle(
              fontSize: 40,
            ),
          ),
        ),
      ),
    );
  }
}
