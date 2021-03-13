import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// Text的基本使用 - 1
    // var text = Text('Kevin Jern 收听浓烟下的诗歌电台'); // 文字组件
    // var show = Container(
    //   color: Color(0x6623FFFF), // 颜色
    //   width: 200, // 宽
    //   height: 200 * 0.618, // 高
    //   child: text, // 孩子
    // );

    /// Text的基本使用 - 2
    // var style = TextStyle(
    //   color: Colors.red, // 颜色
    //   backgroundColor: Colors.white, // 背景色
    //   fontSize: 20, // 字号
    //   fontWeight: FontWeight.bold, // 字粗
    //   fontStyle: FontStyle.italic, // 斜体
    //   letterSpacing: 10, // 字间距
    // );
    // var text = Text(
    //   'Kevin Jern 收听浓烟下的诗歌电台',
    //   style: style,
    // ); // 文字组件
    // var show = Container(
    //   color: Color(0x6623FFFF), // 颜色
    //   width: 200, // 宽
    //   height: 200 * 0.618, // 高
    //   child: text, // 孩子
    // );

    /// 自定义字体
    // var style = TextStyle(
    //     color: Colors.red, // 颜色
    //     backgroundColor: Colors.white, // 背景色
    //     fontFamily: "阿里普惠体");
    // var text = Text(
    //   'Kevin Jern 收听浓烟下的诗歌电台',
    //   style: style,
    // ); // 文字组件
    // var show = Container(
    //   color: Color(0x6623FFFF), // 颜色
    //   width: 200, // 宽
    //   height: 200 * 0.618, // 高
    //   child: text, // 孩子
    // );

    /// Text阴影单色
    // var shadow = Shadow(
    //   color: Colors.black, // 颜色
    //   blurRadius: 1, // 虚化半径
    //   offset: Offset(2, 2)
    // );
    // var style = TextStyle(
    //   color: Colors.grey, // 颜色
    //   fontSize: 80, // 字号
    //   shadows: [shadow] // 阴影
    // );
    // var text = Text(
    //   'Kevin Jern',
    //   style: style,
    // ); // 文字组件
    // var show = Container(
    //   color: Color(0x6623FFFF), // 颜色
    //   width: 400, // 宽
    //   height: 200 * 0.618, // 高
    //   child: text, // 孩子
    // );

    /// Text阴影彩色
    // const rainbow = [
    //   0xffff0000, 0xffFF7F00, 0xffFFFF00, 0xff00FF00, //颜色列表
    //   0xff00FFFF, 0xff0000FF, 0xff8B00FF
    // ];
    // int i = 0;
    // var shadows = rainbow.map((e) {
    //   // 遍历rainbow列表，生成Shadow集合
    //   var shadow = Shadow(
    //       color: Color(e),
    //       blurRadius: i * 2.5,
    //       offset: Offset(-(i + 1) * 3.0, -(i + 1) * 3.0));
    //   i++;
    //   return shadow;
    // }).toList();
    // var style = TextStyle(color: Colors.black, fontSize: 80, shadows: shadows);
    // var text = Text(
    //   'Kevin Jern',
    //   style: style,
    // ); // 文字组件
    // var show = Container(
    //   color: Color(0x6623FFFF), // 颜色
    //   width: 400, // 宽
    //   height: 200 * 0.618, // 高
    //   child: text, // 孩子
    // );

    /// Text的阴影装饰线
    // var style = TextStyle(
    //   color: Colors.black, // 颜色
    //   fontSize: 20, // 字号
    //   decoration: TextDecoration.lineThrough, // 中心穿过
    //   decorationColor: Color(0xFFFF0000), // 装饰线颜色
    //   decorationStyle: TextDecorationStyle.wavy, // 装饰线样式，波浪线
    //   decorationThickness: 0.8, // 装饰线粗
    // );
    // var text = Text('Kevin Jern', style: style,);
    // var show = Container(
    //   color: Color(0x6623FFFF), // 颜色
    //   width: 400, // 宽
    //   height: 200 * 0.618, // 高
    //   child: text, // 孩子
    // );

    /// 文字方向、对齐和溢出处理
    var style = TextStyle(
      color: Colors.black,
      fontSize: 20,
      decoration: TextDecoration.lineThrough,
      decorationColor: Color(0xFFFF0000),
      decorationStyle: TextDecorationStyle.wavy,
      decorationThickness: 0.8,
    );
    var text = Text(
      'Kevin Jern' * 10,
      style: style,
      maxLines: 2, // 最大显示行数
      textAlign: TextAlign.justify, // 对齐方式
      textDirection: TextDirection.ltr, // 文字方向 从左到右
      overflow: TextOverflow.ellipsis, // 文字溢出后显示样式
      softWrap: true, // 是否自动换行
    );
    var show = Container(
      color: Color(0x6623FFFF), // 颜色
      width: 400, // 宽
      height: 200 * 0.618, // 高
      child: text, // 孩子
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        body: Center(
          child: show,
        ),
      ),
    );
  }
}
