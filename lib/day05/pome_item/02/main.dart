import 'package:flutter/material.dart';
import 'circle_image.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var show = Wrap(
      spacing: 20,
      runSpacing: 20,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <Widget>[
        CircleImage(
          image: AssetImage("assets/images/icon_head.png"),
          size: 100,
        ),
        CircleImage(
          image: AssetImage("assets/images/icon_head.png"),
          size: 100,
          shadowColor: Colors.blue,
          roundColor: Colors.blue,
        ),
        CircleImage(
          image: AssetImage("assets/images/icon_head.png"),
          size: 100,
          shadowColor: Colors.red,
          roundColor: Colors.red,
        ),
        CircleImage(
          image: AssetImage("assets/images/icon_head.png"),
          size: 100,
          roundColor: Colors.purple,
          shadowColor: Colors.red,
        ),
        CircleImage(
          image: AssetImage("assets/images/icon_head.png"),
          size: 100,
          shadowColor: Colors.blue,
          roundColor: Colors.orangeAccent,
        )
      ],
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
