import 'package:flutter/material.dart';
import '../goods_widget.dart';

class GoodsDetailPager extends StatelessWidget {
  // 通过构造函数传递参数
  GoodsDetailPager({Key key, @required this.goods}) : super(key: key);
  final GoodBean goods;

  @override
  Widget build(BuildContext context) {
    var btn =
        ElevatedButton(onPressed: () => Navigator.pop(context),
          child: Text('返回主页'),
        );
    return Scaffold(
      appBar: AppBar(
        title: Text(goods.title),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Wrap(
        children: <Widget>[
          Image(
            image: goods.image,
          ),
          Text(goods.title),
          btn,
        ],
      ),
    );
  }
}
