import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
///////----------------------4.4.3 Wrap--------------------
///////---------direction属性测试

    // var show = Wrap(
    //   spacing: 10,
    // 轴向，包括横向和纵向
    //   children: Axis.values.map((e) {
    //     count = 0;
    //     return Column(
    //       children: <Widget>[
    //         Container(
    //           color: Colors.grey.withAlpha(33),
    //           width: 220,
    //           height: 120,
    //           child: Wrap(
    //             spacing: 10.0, // 列间距
    //             runSpacing: 10.0, // 行间距
    //             direction: e, // 元素横向方向
    //             children: <Widget>[
    //               getBox(30, Colors.red),
    //               getBox(30, Colors.cyanAccent),
    //               getBox(45, Colors.green),
    //               getBox(20, Colors.blue),
    //               getBox(30, Colors.orange),
    //               getBox(40, Colors.deepPurpleAccent),
    //               getBox(30, Colors.purple),
    //               getBox(40, Colors.amberAccent),
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

    var show = Wrap(
      spacing: 10,
    // 主轴对齐方式
      children: WrapAlignment.values.map((e) {
        count = 0;
        return Column(
          children: <Widget>[
            Container(
              color: Colors.grey.withAlpha(33),
              width: 220,
              height: 120,
              child: Wrap(
                spacing: 10.0, // 列间距
                runSpacing: 10.0, // 行间距
                alignment: e, // 元素横向方向
                children: <Widget>[
                  getBox(30, Colors.red),
                  getBox(30, Colors.cyanAccent),
                  getBox(45, Colors.green),
                  getBox(20, Colors.blue),
                  getBox(30, Colors.orange),
                  getBox(40, Colors.deepPurpleAccent),
                  getBox(30, Colors.purple),
                  getBox(40, Colors.amberAccent),
                ],
              ),
            ),
            SizedBox(height: 5,),
            Text('${e}',),
            SizedBox(height: 5,)
          ],
        );
      }).toList(),
    );

    // var show = Wrap(
    //   spacing: 10,
    //   // 交叉轴对其方式
    //   children: WrapCrossAlignment.values.map((e) {
    //     count = 0;
    //     return Column(
    //       children: <Widget>[
    //         Container(
    //           color: Colors.grey.withAlpha(33),
    //           width: 220,
    //           height: 120,
    //           child: Wrap(
    //             spacing: 10.0, // 列间距
    //             runSpacing: 10.0, // 行间距
    //             crossAxisAlignment: e, // 元素横向方向
    //             children: <Widget>[
    //               getBox(30, Colors.red),
    //               getBox(30, Colors.cyanAccent),
    //               getBox(45, Colors.green),
    //               getBox(20, Colors.blue),
    //               getBox(30, Colors.orange),
    //               getBox(40, Colors.deepPurpleAccent),
    //               getBox(30, Colors.purple),
    //               getBox(40, Colors.amberAccent),
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

    // var show = Wrap(
    //   spacing: 10,
    //   // 整体交叉轴对齐方式
    //   children: WrapAlignment.values.map((e) {
    //     count = 0;
    //     return Column(
    //       children: <Widget>[
    //         Container(
    //           color: Colors.grey.withAlpha(33),
    //           width: 220,
    //           height: 120,
    //           child: Wrap(
    //             spacing: 10.0, // 列间距
    //             runSpacing: 10.0, // 行间距
    //             runAlignment: e, // 元素横向方向
    //             children: <Widget>[
    //               getBox(30, Colors.red),
    //               getBox(30, Colors.cyanAccent),
    //               getBox(45, Colors.green),
    //               getBox(20, Colors.blue),
    //               getBox(30, Colors.orange),
    //               getBox(40, Colors.deepPurpleAccent),
    //               getBox(30, Colors.purple),
    //               getBox(40, Colors.amberAccent),
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


    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('Flutter Demo'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: show,
            padding: EdgeInsets.only(top: 20),
          ),
        ),
      ),
    );
  }
}

var count = 0;

Widget getBox(double width, Color color) {
  count++;
  return Container(
    alignment: Alignment.center,
    color: color,
    width: width,
    height: width,
    child: Text(
      '$count',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
  );
}
