import 'package:flutter/material.dart';

class PageViewEndless extends StatefulWidget {
  PageViewEndless({this.height, this.width});

  final double height;
  final double width;

  @override
  _PageViewEndlessState createState() => _PageViewEndlessState();
}

class _PageViewEndlessState extends State<PageViewEndless> {
  var width;
  var height;
  List<Color> _colors;

  static final _baseOffset = 10000; // 初始偏移
  static final _initOffset = 1; // 初始索引位

  var _viewportFraction = 0.7; // 视图缩放比
  var _pageCtrl; // 页面控制器

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
      initialPage: _baseOffset + _initOffset, // 初始页面位置
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = width ?? MediaQuery.of(context).size.width;
    height = height ?? 200.0;
    return Container(
      width: width,
      height: height,
      child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: null, // item个数无限
          controller: _pageCtrl,
          itemBuilder: (context, index) => buildChild(_colors, index)),
    );
  }

  Widget buildChild(List<Color> colors, int index) {
    index = fixPosition(index, _baseOffset, colors.length);
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

  int fixPosition(int realPos, int initPos, int length) {
    // 修正索引
    final int offset = realPos - initPos; // 确定偏移值
    int result = offset % length; // 取模得到真实位置
    return result < 0 ? length + result : result;
  }
}
