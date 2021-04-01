import 'package:flutter/material.dart';
import '../goods_widget.dart';

class GoodsDetailPager extends StatelessWidget {
  // 通过构造函数传递参数
  GoodsDetailPager({Key key, @required this.goods}) : super(key: key);
  final GoodBean goods;

  @override
  Widget build(BuildContext context) {
    var btn =
        ElevatedButton(onPressed: () => _toHome(context), child: Text('返回主页'));
    return Scaffold(
      appBar: AppBar(
          title: Text(goods.title),
          backgroundColor: Colors.deepOrangeAccent,
          leading: IconButton( // 顶部导航返回键
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              _toHome(context);
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          )),
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

  // 跳转到主页
  void _toHome(BuildContext context) {
    Navigator.of(context).pop('朕已阅');
  }
}
