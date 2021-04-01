import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_journey/utils/path_provider.dart';

class Star {
  double R; // 外接圆半径
  double r; // 内接圆半径
  int num; // 角的个数
  Color color;

  Star(this.num, this.R, this.r, {this.color = Colors.deepOrange});
}

class StarAnimWidget extends StatefulWidget {
  final Size size;
  StarAnimWidget({Key key, this.size = const Size(200, 200)}) : super(key: key);
  @override
  _StarAnimWidgetState createState() => _StarAnimWidgetState();
}

class _StarAnimWidgetState extends State<StarAnimWidget> with SingleTickerProviderStateMixin {
  AnimationController _controller;  // 控制器
  Animation<int> intAnimation; // int型动画

  Star _star; // 状态量

  @override
  void initState() {
    super.initState();
    _star = Star(5, widget.size.height / 2, widget.size.height / 4);
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this
    );

    intAnimation = IntTween(begin: 5, end: 98).animate(_controller)
      ..addListener(() => renderNum(_star, intAnimation.value))
      ..addStatusListener((status) {
        switch (status) {
          case AnimationStatus.completed:
            print("completed");
            break;
          case AnimationStatus.forward:
            print("forward");
            break;
          case AnimationStatus.reverse:
            print("reverse");
            break;
          case AnimationStatus.dismissed:
            print("dismissed");
            break;
        }
      });
  }

  void renderNum(Star star, num value) {
    setState(() {
      star.num = value;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var show = SizedBox(
      width: widget.size.width,
      height: widget.size.height,
      child: CustomPaint(
        painter: StarPainter(_star),
      ),
    );
    return InkWell(
      child: show,
      onTap: () {
        _controller.reset(); // 重设动画
        // _controller.forward(); // 点击时执行动画
        // _controller.repeat(); // 重复执行动画
        // _controller.repeat(reverse: true, period: Duration(seconds: 3)); // 重复执行动画，反转
        _controller.fling(velocity: 0.1); // 快速执行
      },
      onDoubleTap: () => _controller.stop(), // 双击时暂停动画
    );
  }
}

class StarPainter extends CustomPainter {
  Star _star;
  Paint _paint;

  StarPainter(this._star) {
    _paint = Paint()..color = Colors.deepOrange;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Offset.zero & size;
    canvas.clipRect(rect); // 裁剪区域
    canvas.translate(rect.height / 2, rect.width / 2);
    _drawStar(canvas, _star);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
   return true;
  }

  void _drawStar(Canvas canvas, Star star) {
    canvas.drawPath(
      PathCreator.nStarPath(star.num, star.R, star.r),
      _paint..color = _star.color
    );
  }

}











