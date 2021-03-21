import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var caverStyle = TextStyle(fontSize: 18, shadows: [
      //文字样式
      Shadow(color: Colors.white, offset: Offset(-0.5, 0.5), blurRadius: 0)
    ]);
    const colorMap = {
      // 数据
      0xFFFF0000: "红色", 0xFFFFFF00: "黄色", 0xFF00FF00: "绿色", 0xFF0000FF: "蓝色"
    };
    var show = ListView.builder(
      // 使用builder进行构造ListView
      padding: EdgeInsets.all(8.0),
      itemCount: colorMap.length, // item的个数
      itemBuilder: (BuildContext context, int index) => Container(
        height: 50,
        color: Color(colorMap.keys.toList()[index]),
        child: Center(
          child: Text(
            "${colorMap.values.toList()[index]}",
            style: caverStyle,
          ),
        ),
      ),
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
