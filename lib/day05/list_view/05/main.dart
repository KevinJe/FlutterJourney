import 'package:flutter/material.dart';
import 'package:flutter_journey/day05/chart_widget/chart_widget.dart';
import 'chat_api.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = ChatApi().addMonk(50).chatItem; // 数据源
    var show = ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) => ChatWidget(
        chatItem: data[index],
      ),
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: show,
        ),
      ),
    );
  }
}
