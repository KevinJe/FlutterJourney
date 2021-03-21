import 'package:flutter/material.dart';
import 'package:flutter_journey/day05/pome_item/03/poem_item_widget.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var p1 = PoemItemWidget(
      data: PoemItem(
          image: AssetImage("assets/images/wy_200x300.jpg"),
          title: "以梦为马",
          author: "海子",
          summary: "我要做远方的忠诚的儿子，和物质的短暂情人，和所有以梦为马的诗人一样，我不得不和烈士和小丑走在同一道路上"),
    );

    var p2 = PoemItemWidget(
      data: PoemItem(
          isCard: false,
          image: AssetImage("assets/images/icon_head.png"),
          title: "山海诗",
          author: "张风捷特烈",
          summary:
          "在那片沧海，还未变成桑田的时候，就有了古老的歌，环响在丛林山涧。其声嘹响脱俗，其声缥缈虚无，那是谁的高声颤颤，那是谁的笑语连连。"),
    );

    var show = Padding(padding: EdgeInsets.only(top: 20),
        child: Column(
            children: <Widget>[p1, p2],)
    );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo'),
        ),
        body: show,
      ),
    );
  }
}
