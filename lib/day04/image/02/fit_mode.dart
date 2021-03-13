import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_journey/utils/color_utils.dart';

class FitDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var imgLi = BoxFit.values // 图片的适应模式
        .map((mode) => Column( // 批量生成组件
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(5),
                  width: 100,
                  height: 60,
                  color: ColorUtils.randomColor(),
                  child: Image(
                    image: AssetImage("images/wy_30x20.jpg"),
                    fit: mode,
                  ),
                ),
                Text(mode.toString().split(".")[1]) // 文字
              ],
            ))
        .toList();
    return Wrap(
      children: imgLi,
    );
  }
}
