import 'dart:math';
import 'package:flutter/material.dart';

class FlutterText extends StatefulWidget {
  final String str;
  final TextStyle style;

  FlutterText({this.str, this.style});

  @override
  _FlutterTextState createState() => _FlutterTextState();
}

class _FlutterTextState extends State<FlutterText>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 5000), vsync: this);
    animation = TweenSequence([
      // 使用TweenSequence进行多组补间动画
      TweenSequenceItem<double>(tween: Tween(begin: 0, end: 15), weight: 1),
      TweenSequenceItem<double>(tween: Tween(begin: 13, end: -13), weight: 2),
      TweenSequenceItem<double>(tween: Tween(begin: -11, end: 11), weight: 3),
      TweenSequenceItem<double>(tween: Tween(begin: 9, end: -9), weight: 4),
      TweenSequenceItem<double>(tween: Tween(begin: -7, end: 7), weight: 5),
      TweenSequenceItem<double>(tween: Tween(begin: 5, end: -5), weight: 6),
      TweenSequenceItem<double>(tween: Tween(begin: 3, end: -0), weight: 7),
    ]).animate(controller);
    animation =
        Tween(begin: 0.0, end: pi / 180).animate(animation); // 加buff,将参数转化为弧度
    controller.forward(); // 点击时执行动画
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget child) => Transform(
              transform: Matrix4.rotationZ(animation.value),
              alignment: Alignment.center,
              child: Text(
                widget.str,
                style: widget.style,
              ),
            ));
  }
}
