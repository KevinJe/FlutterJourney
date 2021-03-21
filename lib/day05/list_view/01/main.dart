import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var caverStyle = TextStyle(fontSize: 18, shadows: [
      // 文字样式
      Shadow(color: Colors.white, offset: Offset(-0.5, 0.5), blurRadius: 0),
    ]);
    var show = ListView(
      // ListView
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(8.0), // 边距
      children: <Widget>[
        Container(
          height: 50,
          color: Color(0xFFFF0000),
          child: Center(
            child: Text(
              '红色',
              style: caverStyle,
            ),
          ),
        ),
        Container(
          height: 50,
          color: Color(0xffFFFF00),
          child: Center(
            child: Text(
              '黄色',
              style: caverStyle,
            ),
          ),
        ),
        Container(
          height: 50,
          color: Color(0xff00FF00),
          child: Center(
            child: Text(
              '绿色',
              style: caverStyle,
            ),
          ),
        ),
        Container(
          height: 50,
          color: Color(0xff0000FF),
          child: Center(
            child: Text(
              '蓝色',
              style: caverStyle,
            ),
          ),
        ),
      ],
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo'),
        ),
        body: Center(
          child: show,
        ),
      ),
    );
  }
}
