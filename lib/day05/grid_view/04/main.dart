import 'package:flutter/material.dart';
import 'package:flutter_journey/day05/grid_view/04/grid_custom.dart';
import 'grid_custom.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: GridViewCustom(),
        ),
      ),
    );
  }
}
