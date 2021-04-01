import 'package:flutter/material.dart';
import 'package:flutter_journey/day07/01/ink_well_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('主页'),
        ),
        body: InkWellTest(),
      ),
    );
  }
}
