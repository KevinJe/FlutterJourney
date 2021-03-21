import 'package:flutter/material.dart';
import 'package:flutter_journey/day05/pome_item/03/poem_item_widget.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = <PoemItem>[];
    for (var i = 0; i < 20; i++) {
      data.add(PoemItem(
          isCard: true,
          image: AssetImage("assets/images/wy_200x300.jpg"),
          title: "$i: 以梦为马",
          author: "海子",
          summary: "我要做远方的忠诚的儿子"
              "和物质的短暂情人，和所有以梦为马的诗人一样，"
              "我不得不和烈士和小丑走在同一道路上"));
    }
    var show = ListView.builder(
      padding: EdgeInsets.all(8.0),
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) => PoemItemWidget(
        data: data[index],
      ),
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: show,
        ),
      ),
    );
  }
}
