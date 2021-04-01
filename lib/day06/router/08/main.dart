import 'package:flutter/material.dart';
import 'home_page.dart';
import 'goods_detail_page.dart';
import 'routers.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Routers.generateRoute, // 路由生成器
      initialRoute: Routers.home,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('主页'),
        ),
        body: HomePage(),
      ),
    );
  }
}
