import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  ScrollController _ctrl;
  double _rate = 0;

  @override
  void initState() {
    _ctrl = ScrollController()
      ..addListener(() {
        var max = _ctrl.position.maxScrollExtent; // 可滑动的最大值
        var pixels = _ctrl.position.pixels; // 顶部距离父容器的高度，已经滑动了多少
        setState(() {
          _rate = pixels / max;
          print(_rate);
        });
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
      children: rainbow.map((e) =>
          Container(
            height: 30,
            width: 200,
            color: Color(e),
          )).toList(),
    );

    var scroll = SingleChildScrollView(
      controller: _ctrl,
      child: Transform.scale(scale: 1 - _rate * 0.5,
        child: Transform.rotate(angle: _rate * 2 * pi,
          child: items,),),
    );

    return Container(
      padding: EdgeInsets.all(8),
      width: 300,
      height: 150,
      color: Colors.grey.withAlpha(44),
      child: scroll,
    );
  }
}
