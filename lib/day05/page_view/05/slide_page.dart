import 'dart:async';
import 'dart:ffi';
import 'dart:math';
import 'package:flutter/material.dart';

class PageConfig {
  // 页面配置类
  final int initOffset;
  final double viewportFraction;
  final double offsetFactor; // 左右组件偏移系数
  final double scaleFactor; // 左右组件缩放系数
  final double swingAngle; // 左右组件倾斜角
  final bool autoPlay; // 是否自动播放
  final int autoPlayDuration_s; // 自动播放间隔时间

  PageConfig({this.initOffset = 1,
    this.viewportFraction = 0.6,
    this.offsetFactor = 0.35,
    this.scaleFactor = 0.5,
    this.swingAngle = 10,
    this.autoPlay = false,
    this.autoPlayDuration_s = 5}); // 左右组件倾斜角
}

class SlidePage extends StatefulWidget {
  SlidePage({this.height,
    this.width,
    @required this.children,
    @required this.config,
    this.onPageChanged,
    this.onClick});

  final double height; // 组件高
  final double width; // 组件宽
  final List<Widget> children;
  final PageConfig config;
  final ValueChanged<int> onPageChanged;
  final ValueChanged<int> onClick;

  @override
  _SlidePageState createState() => _SlidePageState();
}

class _SlidePageState extends State<SlidePage> {
  var width;
  var height;
  PageController _pageCtrl; // 页面控制器
  var _factor = 0.0; // 分度值
  static final _baseOffset = 10000; // 初始偏移
  var _initOffset = 1; // 初始索引位
  var _realPosition; // 真实索引位
  var _viewportFraction; // 视窗缩放比
  double _offsetFactor; // 左右组件偏移系数
  double _scaleFactor; // 左右组件缩放系数
  double _swingAngle; // 左右组件倾斜角
  Timer _timer;

  @override
  void initState() {
    _viewportFraction = widget.config.viewportFraction;
    _initOffset = widget.config.initOffset;
    _realPosition = _baseOffset + _initOffset;
    _offsetFactor = widget.config.offsetFactor;
    _scaleFactor = widget.config.scaleFactor;
    _swingAngle = widget.config.swingAngle;

    _pageCtrl = PageController(
      // 页面控制器
      viewportFraction: _viewportFraction, // 视图缩放比
      initialPage: _baseOffset + _initOffset, // 初始位置
    )
      ..addListener(() {
        // 滑动监听
        var page = _pageCtrl.page - _baseOffset;
        var floor = page.floor();
        _factor = page - floor; // 分度值
        setState(() {
          // 刷新状态，更新真实索引值
          _realPosition = _pageCtrl.page.floor();
        });
      });
    _timer = initTimer();
    super.initState();
  }

  Timer initTimer() {
    // 初始化计时器
    return Timer.periodic(Duration(seconds: widget.config.autoPlayDuration_s),
            (timer) {
          if (widget.config.autoPlay) {
            switchTo(_realPosition + 1);
          }
        });
  }

  switchTo(int index) {
    // 跳转到指定页
    _pageCtrl.animateToPage(index,
        duration: const Duration(microseconds: 500), curve: Curves.easeInOut);
  }

  void resetTimer() {
    // 触摸时停止计时器并初始化
    _timer.cancel();
    _timer = Timer(Duration(seconds: widget.config.autoPlayDuration_s), () {
      _timer = initTimer();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = widget.width ?? MediaQuery
        .of(context)
        .size
        .width;
    height = widget.height ?? 120.0;
    return Container(
      width: width,
      height: height,
      child: PageView.builder( // 使用PageView
        controller: _pageCtrl,
        scrollDirection: Axis.horizontal,
        // 滑动方向
        itemCount: null,
        // 条目无限
        itemBuilder: (context, index) => buildChild(widget.children, index),
        // 创建条目
        onPageChanged: (page) {
          if (widget.onPageChanged != null) {
            widget.onPageChanged(
                fixPosition(page, _baseOffset, widget.children.length));
          }
        },
      ),
    );
  }

  // 创建item
  Widget buildChild(List<Widget> children, int index) {
    var i = fixPosition(index, _baseOffset, children.length);
    var child = AnimatedBuilder(
        animation: _pageCtrl,
        child: widget.children[i], // 使用组件列表
        builder: (BuildContext context, child) {
          if (_pageCtrl.position.minScrollExtent == null ||
              _pageCtrl.position.maxScrollExtent == null) {
            Future.delayed(Duration(microseconds: 1), () => setState(() {}));
            return Container();
          }
          var offset = width * _viewportFraction * _offsetFactor *
              (1 - _factor);
          var center = Offset(width * _viewportFraction / 2, height / 2);
          var angle = _swingAngle * (1 - _factor) / 180 * pi;
          var scale = _scaleFactor * (1 + _factor);
          if (index == _realPosition - 1) { // 左侧变换
            return GestureDetector(
              onTap: () {
                resetTimer();
                switchTo(index);
              },
              child: Transform.scale(scale: scale,
                child: Transform.translate(
                  offset: Offset(offset, 0),
                  child: Transform(origin: center,
                    transform: Matrix4.skew(angle, -angle),),
                ),
              ),
            );
          }
          if (index == _realPosition + 1) { // 右侧变换
            return GestureDetector(
              onTap: () {
                resetTimer();
                switchTo(index);
              },
              child: Transform.scale(scale: scale,
                child: Transform.translate(offset: Offset(-offset, 0),
                  child: Transform(origin: center,
                    transform: Matrix4.skew(-angle, angle),
                    child: child,
                  ),
                ),
              ),
            );
          }
          return GestureDetector(
            onTap: () {
              resetTimer();
              if (widget.onClick != null) {
                widget.onClick(i);
              }
            },
            child: Transform.scale(scale: 1 - _scaleFactor * _factor,
              child: child,),
          );
        });
    return child;
  }

  int fixPosition(int realPos, int initPos, int length) {
    final int offset = realPos - initPos;
    int result = offset % length;
    return result < 0 ? length + result : result;
  }
}
