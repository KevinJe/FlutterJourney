import 'package:flutter/material.dart';

class InkWellTest extends StatefulWidget {
  @override
  _InWellTestState createState() => _InWellTestState();
}

class _InWellTestState extends State<InkWellTest> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        child: Container(
          alignment: Alignment.center,
          width: 120,
          height: 120 * 0.681,
          child: Text('点我'),
        ),
        splashColor: Colors.grey, // 水波纹色
        highlightColor: Colors.blue, // 长按时会显示该颜色
        borderRadius: BorderRadius.all(Radius.elliptical(10, 10)), // 圆角半径
        onTapDown: (detail) => // 按下事件
            print('全局坐标:${detail.globalPosition}-----相对坐标:${detail.localPosition}'),
        onTap: () => print('onTap in InkWell'), // 单击事件
        onDoubleTap: () => print('onDoubleTap in InkWell'), // 双击事件
        onLongPress: () => print('onLongPress in InkWell'), // 长按事件
        onHighlightChanged: (bool value) => print('onHighlightChanged $value'), // 高亮变化事件
      ),
    );
  }
}
