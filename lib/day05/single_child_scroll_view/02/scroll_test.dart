import 'package:flutter/material.dart';
import 'package:flutter_journey/day02/03/utils/color_utils.dart';

class ScrollTest extends StatefulWidget {
  @override
  _ScrollTestState createState() => _ScrollTestState();
}

class _ScrollTestState extends State<ScrollTest> {
  //颜色列表
  var rainbow = [
    0xffff0000,
    0xffFF7F00,
    0xffFFFF00,
    0xff00FF00,
    0xff00FFFF,
    0xff0000FF,
    0xff8B00FF
  ];
  ScrollController _ctrl; // 滑动控制器

  @override
  void initState() {
    _ctrl = ScrollController(initialScrollOffset: 10) // 初始偏移值
      ..addListener(() {
        var min = _ctrl.position.minScrollExtent; // 可滑动的最小值
        var max = _ctrl.position.maxScrollExtent; // 可滑动的最大值
        print('---Extent:---$min---------$max----');

        var axis = _ctrl.position.axis; // 滑动的轴向
        print('---axis:-----$axis----------');

        var pixels = _ctrl.position.pixels; // 顶部距离父容器的高度，也就是已经滑动了多少
        print('---pixels:-----$pixels------------');

        var atEdge = _ctrl.position.atEdge; // 是否滑动到底或顶，可以和下面属性结合使用
        var direction =
            _ctrl.position.userScrollDirection; // 向上 ScrollDirection.forward
        print('-----atEdge:-----$atEdge---------direction:----$direction----');

        var dimension = _ctrl.position.viewportDimension; // 滑动区域的大小
        print('-----dimension:----$dimension-------');
      });
    super.initState();
  }

  @override
  void dispose() {
    _ctrl.dispose(); // 销毁控制器
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var items = Column(
      children: rainbow
          .map((e) => Container(
                height: 30,
                width: 200,
                color: Color(e),
              ))
          .toList(),
    );
    return Container(
      padding: EdgeInsets.all(8),
      width: 300,
      height: 150,
      color: Colors.grey.withAlpha(44),
      child: SingleChildScrollView(
        child: items,
        controller: _ctrl,
      ),
    );
  }
}
