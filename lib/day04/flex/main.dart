import 'package:flutter/material.dart';

void main() => runApp(App());

///////----------------------4.4.1.4  Flex--测试1--------------------
// var redBox = Container(
//   color: Colors.red, height: 50, width: 50,
// );
// var blueBox = Container(
//   color: Colors.blue, height: 30, width: 60,
// );
// var yellowBox = Container(
//   color: Colors.yellow, height: 50, width: 100,
// );
// // direction 轴向 horizontal 水平主轴
// var show = Flex(direction: Axis.horizontal, mainAxisSize: MainAxisSize.max,
// children: <Widget>[redBox, blueBox, yellowBox], );

// var show = Flex(direction: Axis.vertical,
//   children: MainAxisAlignment.values.map((e) {
//     return Column(
//       children: <Widget>[
//         Container(
//           color: Colors.grey.withAlpha(33),
//           width: 280,
//           height: 120,
//           child: Flex(
//             mainAxisAlignment: e,
//             direction: Axis.horizontal,
//             children: <Widget>[
//               redBox, blueBox, yellowBox
//             ],
//           ),
//         ),
//         SizedBox(height: 5,),
//         Text('${e}',),
//         SizedBox(height: 5,)
//       ],
//     );
//   }).toList(),
// );

// var show = Flex(direction: Axis.vertical,
//   children: CrossAxisAlignment.values.map((e) {
//     return Column(
//       children: <Widget>[
//         Container(
//           color: Colors.grey.withAlpha(33),
//           width: 280,
//           height: 120,
//           child: Flex(
//             crossAxisAlignment: e,
//             direction: Axis.horizontal,
//             children: <Widget>[
//               redBox, blueBox, yellowBox
//             ],
//           ),
//         ),
//         SizedBox(height: 5,),
//         Text('${e}',),
//         SizedBox(height: 5,)
//       ],
//     );
//   }).toList(),
// );

// var show = Flex(direction: Axis.vertical,
//   // verticalDirection: VerticalDirection.up,
//   children: MainAxisAlignment.values.map((e) {
//     return Column(
//       children: <Widget>[
//         Container(
//           color: Colors.grey.withAlpha(33),
//           width: 280,
//           height: 120,
//           child: Flex(
//             textDirection: TextDirection.rtl,
//             mainAxisAlignment: e,
//             direction: Axis.horizontal,
//             children: <Widget>[
//               redBox, blueBox, yellowBox
//             ],
//           ),
//         ),
//         SizedBox(height: 5,),
//         Text('${e}',),
//         SizedBox(height: 5,)
//       ],
//     );
//   }).toList(),
// );


///////----------------------4.4.1.4 Flex--测试2--------------------
// var redBox = Container(
//   color: Colors.red, height: 50, width: 50,
// );
// var blueBox = Container(
//   color: Colors.blue, height: 30, width: 60,
// );
// var yellowBox = Container(
//   color: Colors.yellow, height: 50, width: 100,
// );
// // Expanded 包裹的组件会自动延申填充剩余空间
// var show = Flex(direction: Axis.horizontal,
//   children: <Widget>[redBox,
//     Expanded(child: blueBox), yellowBox],);

///////----------------------4.4.1.4 Flex--测试3--------------------
// var redBox = Container(
//   color: Colors.red, height: 50, width: 50,
// );
// var blueBox = Container(
//   color: Colors.blue, height: 30, width: 60,
// );
// var yellowBox = Container(
//   color: Colors.yellow, height: 50, width: 100,
// );
// // Expanded 包裹的组件会自动延申填充剩余空间
// // 如下，就是红蓝均分剩余空间
// var show = Flex(direction: Axis.horizontal,
//   children: <Widget>[
//     Expanded(child: redBox),
//     Expanded(child: blueBox),
//     yellowBox],);

///////----------------------4.4.1.4 Flex--测试4--------------------
var redBox = Container(
  color: Colors.red, height: 50, width: 50,
);
var blueBox = Container(
  color: Colors.blue, height: 30, width: 60,
);
var yellowBox = Container(
  color: Colors.yellow, height: 50, width: 100,
);
// Expanded 包裹的组件会自动延申填充剩余空间
// flex 属性指定占位比例 如下 红蓝比例未 3:2
var show = Flex(direction: Axis.horizontal,
  children: <Widget>[
    Expanded(child: redBox, flex: 3,),
    Expanded(child: blueBox, flex: 2,),
    yellowBox],);

///////----------------------4.4.1.6  Flex布局使用练习1--------------------
// var text = Text("附近", style: TextStyle(fontSize: 18),);
// var iconLeft = Icon(Icons.add_location, size: 30, color: Colors.pink,);
// var iconRight = Icon(Icons.keyboard_arrow_right, color: Colors.black,);
// var show = Container(height: 70, color: Color(0x4484FFFF),
//   child: Row(
//     children: <Widget>[
//       Padding(child: iconLeft, padding: EdgeInsets.only(left: 25, right: 20),),
//       Expanded(child: text,),
//       Padding(child: iconRight, padding: EdgeInsets.only(right: 25),)
//     ],
//   ),);

///////----------------------4.4.1.6  Flex布局使用练习2--------------------
// var infoStyle = TextStyle(color: Color(0xFF999999), fontSize: 13);
// var littleStyle = TextStyle(color: Colors.black, fontSize: 16);
//
// // 顶部
// var top = Row(
//   children: <Widget>[
//     Image.asset(
//       "images/icon_head.png",
//       width: 20,
//       height: 20,
//     ),
//     SizedBox(
//       width: 5,
//     ),
//     Expanded(child: Text("Kevin Jern")),
//     Text(
//       "Flutter/Dart",
//       style: infoStyle,
//     )
//   ],
// );
//
// // 中间文字内容
// var content = Column(
//   crossAxisAlignment: CrossAxisAlignment.start,
//   children: <Widget>[
//     Text(
//       "[Flutter必备]-Flex布局完全解读",
//       style: littleStyle,
//       maxLines: 2,
//       overflow: TextOverflow.ellipsis,
//     ),
//     SizedBox(
//       height: 5,
//     ),
//     Text(
//       "也就是水平排放还是竖直排放，可以看出默认情况下都是主轴顶头,"
//       "交叉轴居中比如horizontal下主轴为水平轴，",
//       style: infoStyle,
//       maxLines: 2,
//       overflow: TextOverflow.ellipsis,
//     )
//   ],
// );
//
// // 中间
// var center = Row(
//   children: <Widget>[
//     Expanded(child: content),
//     SizedBox(
//       width: 5,
//     ),
//     ClipRRect(
//       borderRadius: BorderRadius.all(Radius.circular(5)),
//       child: Image(
//         width: 80,
//         height: 80,
//         fit: BoxFit.cover,
//         image: AssetImage("images/wy_200x300.jpg"),
//       ),
//     )
//   ],
// );
//
// // 底部
// var end = Row(children: <Widget>[
//   Icon(
//     Icons.grade,
//     color: Colors.green,
//     size: 20,
//   ),
//   Text(
//     "3000W",
//     style: infoStyle,
//   ),
//   SizedBox(
//     width: 10,
//   ),
//   Icon(
//     Icons.tag_faces,
//     color: Colors.lightBlueAccent,
//     size: 20,
//   ),
//   Text(
//     "3000W",
//     style: infoStyle,
//   ),
// ]);
//
// var show = Container(
//   height: 160,
//   margin: EdgeInsets.all(5),
//   decoration: BoxDecoration(
//       color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
//   padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
//   child: Column(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: <Widget>[top, center, end],
//   ),
// );

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: show,
          ),
        ),
      ),
    );
  }
}
