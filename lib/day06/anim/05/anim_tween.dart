import 'package:flutter/material.dart';
import 'package:flutter_journey/utils/path_provider.dart';

class Star {
  double R; // 外接圆半径
  double r; // 内接圆半径
  int num; // 角的个数
  Color color;

  Star(this.num, this.R, this.r, { this.color = Colors.deepOrange });
}

class StarAnimWidget extends StatefulWidget {
  final Size size;

  StarAnimWidget({Key key, this.size = const Size(200, 200)}) : super(key: key);

  @override
  _StarAnimWidgetState createState() => _StarAnimWidgetState();
}

class _StarAnimWidgetState extends State<StarAnimWidget> with SingleTickerProviderStateMixin{
  AnimationController controller;
  Animation<double> animation; // 动画
  Star _star; // 状态量

  @override
  void initState() {
    _star = Star(5, widget.size.height / 2, widget.size.height / 4);
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this
    );
    var tween = Tween(begin: 100.0, end: 20.0); // 创建从100到20变化的Animatable对象
    animation = tween.animate(controller); // 执行animate方法
    animation.addListener(() => render(_star, animation.value)); // 添加监听
  }

  @override
  void dispose() {
    controller.dispose();
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
      onTap: () => controller.forward(),
      onDoubleTap: () => controller.stop(),
    );
  }

  // 核心渲染方法
  void render(Star star, num value) {
    setState(() {
      star.R = value;
    });
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
    canvas.clipRect(rect);
    canvas.translate(rect.height / 2, rect.width / 2);
    _drawStar(canvas, _star);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  _drawStar(Canvas canvas, Star star) {
    canvas.drawPath(
      PathCreator.nStarPath(star.num, star.R, star.r),
      _paint..color = star.color
    );
  }

}








