import 'package:flutter/material.dart';
import 'flutter_container.dart';

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
        body: Center(
            child: FlutterContainer(
                config:
                    AnimConfig(mode: FlutterMode.random, curve: Curves.linear),
                child: Icon(
                  Icons.android,
                  size: 50,
                  color: Colors.green,
                ))),
      ),
    );
  }
}
