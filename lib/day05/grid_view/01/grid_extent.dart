import 'package:flutter/material.dart';
import 'package:flutter_journey/utils/color_utils.dart';

class GridViewExtent extends StatefulWidget {
  @override
  _GridViewExtentState createState() => _GridViewExtentState();
}

class _GridViewExtentState extends State<GridViewExtent> {
  List<int> data;

  @override
  void initState() {
    data = List.generate(50, (index) => index); // 生成50个数字
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var extend = GridView.extent( // 使用GridView.extent来创建GridView
      maxCrossAxisExtent: 150.0, // 最大延伸值
      padding: EdgeInsets.all(10),
      scrollDirection: Axis.vertical, // 滑动方向
      mainAxisSpacing: 10, // 主轴间距
      crossAxisSpacing: 10, // 交叉轴间距
      childAspectRatio: 1 / 0.618, // 交叉轴方向item尺寸 / 主轴方向item尺寸
      children: data.map((e) =>
        Container(
          alignment: Alignment.center,
          color: ColorUtils.randomColor(),
          child: Text("$e"),
        )).toList(),
    );
    return extend;
  }
}
