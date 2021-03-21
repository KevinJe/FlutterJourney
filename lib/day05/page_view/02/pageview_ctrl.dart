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
  var _viewportFraction = 0.7; // 视图缩放比
  var _pageCtrl; // 页面控制器
  var _initOffset = 1; // 页面位置

  @override
  void initState() {
    _colors = [
      Colors.red,
      Colors.yellow,
      Colors.blue,
      Colors.green,
      Colors.black
    ];
    _pageCtrl = PageController(
        // 页面控制器
        viewportFraction: _viewportFraction, // 视图缩放比
        initialPage: _initOffset // 初始页面位置
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = widget.width ?? MediaQuery.of(context).size.width; // 宽不设置 默认设置为屏幕宽
    height = widget.height ?? 200.0; // 高不设置 默认 200
    return Container(
      width: width,
      height: height,
      child: PageView.builder(
          itemBuilder: (context, index) => buildChild(_colors, index), // 创建条目
          itemCount: _colors.length, // item个数
          scrollDirection: Axis.horizontal, // 滑动方向
          controller: _pageCtrl,
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
