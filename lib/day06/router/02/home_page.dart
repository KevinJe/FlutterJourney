import 'package:flutter/material.dart';
import 'package:flutter_journey/day06/router/goods_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var goods = GoodsWidget(
      onTap: (goods) => _toDetailPager(context, goods), // 跳转到详情界面
      width: 200,
      goods: GoodBean(
        price: 21.89,
        saleCount: 99,
        title: "XXXXX文具商务复古25K/A5记事本PU软皮面日记本子定制可印logo简约工作笔记本会议记录本小清新大学生用",
        image: AssetImage("assets/images/note_cover.jpg")
      ),
    );
    return goods;
  }

  void _toDetailPager(BuildContext context, GoodBean goods) {
    // 使用Navigator 来将页面push到堆栈中
    Navigator.of(context).pushNamed("/detail");
  }
}
