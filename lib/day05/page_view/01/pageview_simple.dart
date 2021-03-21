import 'package:flutter/material.dart';

class PageViewSimple extends StatefulWidget {
  PageViewSimple({this.height, this.width});

  final double height; // 组件高
  final double width; // 组件宽

  @override
  _PageViewSimpleState createState() => _PageViewSimpleState();
}

class _PageViewSimpleState extends State<PageViewSimple> {
  var width;
  var height;
  List<Color> _colors;

  @override
  void initState() {
    _colors = [
      Colors.red,
      Colors.yellow,
      Colors.blue,
      Colors.green,
      Colors.black
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = widget.width ?? MediaQuery.of(context).size.width; // 宽不设置 默认为屏幕宽度
    height = widget.height ?? 200.0; // 高不设置 默认120
    return Container(
      width: width,
      height: height,
      child: PageView.builder(
        // PageView
        itemBuilder: (context, index) => buildChild(_colors, index), // 创建条目
        scrollDirection: Axis.horizontal, // 滑动方向
        itemCount: _colors.length, // item 个数
      ),
    );
  }

  Widget buildChild(List<Color> colors, int index) {
    var result = Container(
      child: Text(
        '第$index页',
        style: TextStyle(color: Colors.white, fontSize: 30),
      ),
      alignment: Alignment.center,
      color: colors[index],
    );
    return result;
  }
}
