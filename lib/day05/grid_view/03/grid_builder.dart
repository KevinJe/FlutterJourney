import 'package:flutter/material.dart';
import 'package:flutter_journey/utils/color_utils.dart';

class GridViewBuilder extends StatefulWidget {
  @override
  _GridViewBuilderState createState() => _GridViewBuilderState();
}

class _GridViewBuilderState extends State<GridViewBuilder> {
  List<int> data;

  @override
  void initState() {
    data = List.generate(50, (index) => index); // 生成50个数字
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var builder = GridView.builder( // 使用GridView.builder创建GridView，与extent或者count方式不同，builder方式创建的条目指挥预加载未显示的下一排
        itemCount: data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          // 网格代理：固定交叉轴数目，约束内部条目的行为
          crossAxisCount: 2, // 交叉轴条目数
          mainAxisSpacing: 10, // 主轴间距
          crossAxisSpacing: 10, // 交叉轴间距
          childAspectRatio: 1 / 0.618, // 交叉轴方向item尺寸 / 主轴方向item尺寸
        ),
        itemBuilder: (_, position) => Container( // 创建条目
              alignment: Alignment.center,
              color: ColorUtils.randomColor(limitA: 255),
              child: Text("$position"),
            ));
    return builder;
  }
}
