import 'package:flutter/material.dart';
import 'grid_builder.dart';

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
        body: Padding(
          padding: EdgeInsets.all(10),
          child: GridViewBuilder(),
        ),
      ),
    );
  }
}
