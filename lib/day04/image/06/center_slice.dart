import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CenterSliceDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var img = Image.asset(
      'images/right_chat.png',
      centerSlice: Rect.fromLTRB(9, 27, 60, 27 + 1.0), // 矩形区域可以缩放，类似Android中的.9.png
      fit: BoxFit.fill,
    );
    var show = Container(
      width: 300,
      height: 100,
      child: img,
    );

    return show;
  }
}
