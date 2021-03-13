import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlendDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var imgLi = BlendMode.values // 图片与颜色混合
        .map((mode) => Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(5),
                  width: 60,
                  height: 60,
                  child: Image(
                    image: AssetImage("images/icon_head.png"),
                    color: Colors.blue,
                    colorBlendMode: mode,
                  ),
                ),
                Text(mode.toString().split(".")[1]),
              ],
            ))
        .toList();
    return Wrap(
      children: imgLi,
    );
  }
}
