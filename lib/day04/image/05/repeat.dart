import 'package:flutter/material.dart';
import 'package:flutter_journey/utils/color_utils.dart';

class ImageRepeatDemo extends StatefulWidget {
  @override
  _ImageRepeatDemoState createState() => _ImageRepeatDemoState();
}

class _ImageRepeatDemoState extends State<ImageRepeatDemo> {
  @override
  Widget build(BuildContext context) {
    var imgLi = ImageRepeat.values // 重复模式
        .map((repeat) => Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(5),
                  width: 150,
                  height: 60,
                  color: ColorUtils.randomColor(),
                  child: Image(
                    image: AssetImage('images/wy_30x20.jpg'),
                    repeat: repeat,
                  ),
                ),
                Text(repeat.toString())
              ],
            ))
        .toList();

    return Wrap(
      children: imgLi,
    );
  }
}
