import 'package:flutter/material.dart';
import 'package:flutter_journey/utils/color_utils.dart';

class AlignmentDemo extends StatefulWidget {
  @override
  _AlignmentDemoState createState() => _AlignmentDemoState();
}

class _AlignmentDemoState extends State<AlignmentDemo> {
  bool _little = true;

  @override
  Widget build(BuildContext context) {
    var alignment = [
      Alignment.center,
      Alignment.centerLeft,
      Alignment.centerRight,
      Alignment.topCenter,
      Alignment.topLeft,
      Alignment.topRight,
      Alignment.bottomCenter,
      Alignment.bottomLeft,
      Alignment.bottomRight,
      Alignment(0.01, 0.01),
      Alignment(0.5, 0.5),
    ]; // 对齐模式

    var imgLi = alignment
        .map((alignment) => Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(5),
                  width: 150,
                  height: 60,
                  color: ColorUtils.randomColor(),
                  child: Image(
                    image: AssetImage(_little
                        ? "images/wy_30x20.jpg"
                        : "images/wy_300x200.jpg"),
                    alignment: alignment,
                  ),
                ),
                Text(alignment.toString())
              ],
            ))
        .toList();

    return Wrap(
      children: [...imgLi, Switch(value: _little, onChanged: (b) {
        setState(() {
          _little = b;
        });
      })],
    );
  }
}
