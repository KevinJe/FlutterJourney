import 'package:flutter/material.dart';

class GridPager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint( // 使用 CustomPaint 放置画布
      painter: GridLinePainter(),
    );
  }
}

class GridLinePainter extends CustomPainter {
  Paint _paint; // 画笔
  Path _path = Path(); // 路径

  GridLinePainter() {
    _paint = Paint() // 创建画笔对象，使用级联操作符设置画笔属性
      ..style = PaintingStyle.stroke // 画线条
      ..color = Color(0xFFBBC3C5) // 颜色
      ..isAntiAlias = true; // 抗锯齿
  }


  @override // 绘制方法
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(gridPath(20, size), _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  Path gridPath(double step, Size area) {
    // 绘制网格路径 step 小格边长 area 绘制区域
    for (int i = 0; i < area.height / step + 1; i++) {
      _path.moveTo(0, step * i); // 移动path
      _path.lineTo(area.width, step * i); // 画横线
    }
    // 画纵线
    for (int i = 0; i < area.width / step + 1; i++) {
      _path.moveTo(step * i, 0);
      _path.lineTo(step * i, area.height);
    }
    return _path;
  }

}
