import 'package:flutter/material.dart';

class ScrollTest extends StatefulWidget {
  @override
  _ScrollTestState createState() => _ScrollTestState();
}

class _ScrollTestState extends State<ScrollTest> {
  // 颜色列表
  var rainbow = [
    0xffff0000,
    0xffFF7F00,
    0xffFFFF00,
    0xff00FF00,
    0xff00FFFF,
    0xff0000FF,
    0xff8B00FF
  ];

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
      ),
    );
  }
}
