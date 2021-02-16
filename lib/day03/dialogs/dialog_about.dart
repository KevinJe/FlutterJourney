import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogAbout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: _buildTitle(),
      content: _buildContent(),
      actions: <Widget>[
        const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Power By Kevin'),
        )
      ],
    );
  }

  final imgPath = 'assets/images/icon_head.png';

  Widget _buildTitle() => Row(
    children: <Widget>[
      Image.asset(imgPath, width: 30, height: 30,),
      SizedBox(width: 10,),
      Text('关于')
    ],
  );

  _buildContent() => Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      FlutterLogo(size: 50,),
      SizedBox(height: 20,),
      Text('Flutter Unit v0.0.1')
    ],
  );
}
