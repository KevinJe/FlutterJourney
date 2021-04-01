import 'package:flutter/material.dart';

class FpsShow extends StatefulWidget {
  @override
  _FpsShowState createState() => _FpsShowState();
}

// 下边用到了vsync，所以混入SingleTickerProviderStateMixin
// 如果状态类中有多个AnimationController，需要使用 TickerProviderStateMixin 而不是 SingleTickerProviderStateMixin
// 可以看注释有说明
class _FpsShowState extends State<FpsShow> with SingleTickerProviderStateMixin {
  String _fps = ""; // 文字
  AnimationController controller; // 动画控制器
  var _oldTime = DateTime.now().millisecondsSinceEpoch; // 首次运行时间

  @override
  void initState() {
    controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this); // 创建AnimationController对象
    controller.addListener(_render); // 添加监听 执行渲染
    controller.repeat(); // 重复不断执行动画
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  _render() { // 渲染方法 更新状态
    setState(() {
      var now = DateTime.now().millisecondsSinceEpoch; // 新时间
      var dt = now - _oldTime; // 两次刷新间隔的毫秒值
      _fps = (1000 / dt).toStringAsFixed(1); // 1000毫秒可以刷新多少次FPS
      print(_fps);
      _oldTime = now; // 重新赋值
    });

  }
}
