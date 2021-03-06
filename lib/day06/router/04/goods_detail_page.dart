import 'package:flutter/material.dart';
import 'package:flutter_journey/day06/router/goods_widget.dart';

class GoodsDetailPager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品详情页'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Row(
        children: <Widget>[
          ElevatedButton(
            onPressed: () => _toSelf(context),
            child: Text('打开自己'),
          ),
          SizedBox(width: 10,),
          ElevatedButton(
            onPressed: () {
              _toHome(context);
            },
            child: Text('返回主页'),
          )
        ],
      ),
    );
  }

  // 跳转到主页
  void _toHome(BuildContext context) {
    Navigator.of(context).popUntil(ModalRoute.withName('/'));
  }

  // 跳转到主页
  void _toSelf(BuildContext context) {
    Navigator.of(context).pushNamed('/detail');
  }
}
