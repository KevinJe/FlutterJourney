import 'package:flutter/material.dart';
import 'home_page.dart';
import 'goods_detail_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      routes: <String, WidgetBuilder>{
        '/detail': (BuildContext ctx) => GoodsDetailPager(goods: ModalRoute.of(ctx).settings.arguments), // 获取参数 详情页参数
        '/logo': (BuildContext context) => FlutterLogo(),
      },
    );
  }
}
