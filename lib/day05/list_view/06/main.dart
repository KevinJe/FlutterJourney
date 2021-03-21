import 'package:flutter/material.dart';
import 'chat_page.dart';
import 'package:flutter_journey/day03/views/home/home_menu.dart';

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
          title: Text('Kevin Jern'),
          leading: Icon(Icons.arrow_back_ios),
          actions: <Widget>[HomeMenu()],
        ),
        body: ChatPage(),
      ),
    );
  }
}
