import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_journey/day02/03/utils/color_utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _info = 'parse';

  void _incrementCounter() {
    var num = 'a';
    setState(() {
      var str2num = str2Num(num);
      if (str2num != null) {
        _info = '$str2num';
      } else {
        _info = '转换异常，请输入正确数字';
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _info,
              style: Theme.of(context).textTheme.display1,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  num str2Num(String str) {
    var result = 0;
    try { // 捕获全部异常
      result = num.parse(str);
    } catch (e) {
      print('发生异常: $e');
      return null;
    } finally {
      print('最终会被执行的代码块');
    }
    return result;
  }

}
