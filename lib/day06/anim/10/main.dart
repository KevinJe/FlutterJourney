import 'package:flutter/material.dart';
import 'anim_tween.dart';

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
        appBar: AppBar(
          title: Text("Animation Demo"),
        ),
        body: Center(child: StarAnimWidget()),
      ),
    );
  }
}