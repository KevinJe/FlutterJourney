import 'package:flutter/material.dart';
import 'const_res.dart';

class ClockPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('粒子数字'),
      ),
      body: CustomPaint(
        painter: ClockPainter(),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  Paint _paint;
  var _radius = 3.0; // 小球半径
  Path _path = Path(); // 路径

  ClockPainter() {
    _paint = Paint()
        ..color = Color(0xFF45D0FD)
        ..isAntiAlias = true;
    _path.addOval(Rect.fromCircle(center: Offset(0, 0), radius: _radius)); // 小球路径
  }

  @override
  void paint(Canvas canvas, Size size) {
    renderDigit(1, canvas); // 渲染数字
    canvas.translate(65, 0);
    renderDigit(9, canvas);
    canvas.translate(65, 0);
    renderDigit(9, canvas);
    canvas.translate(65, 0);
    renderDigit(7, canvas);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  /// 渲染数字，num 数字，canvas 画布
  void renderDigit(int num, Canvas canvas) {
    if (num > 10) {
      return;
    }
    for (int i = 0; i < digit[num].length; i++) {
      for (int j = 0; j < digit[num][j].length; j++) {
        if (digit[num][i][j] == 1) { // 遇见数字 1 就将画布保存起来
          canvas.save();
          double rX = j * 2 * (_radius + 1) + (_radius + 1); // 第(i, j) 个点圆心横坐标
          double rY = i * 2 * (_radius + 1) + (_radius + 1); // 第(i, j) 个点圆心纵坐标
          canvas.translate(rX, rY);
          canvas.drawPath(_path, _paint);
          canvas.restore(); // 恢复画布
        }
      }
    }
  }
}
