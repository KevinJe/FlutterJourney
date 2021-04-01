import 'package:flutter/material.dart';
import 'home_page.dart';
import 'router.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Routers.generateRoute, // 路由生成器
      initialRoute: Routers.home, // 初始路由
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
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

