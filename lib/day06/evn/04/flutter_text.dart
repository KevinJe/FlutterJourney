import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_journey/day06/evn/03/flutter_container.dart';

class FlutterText extends StatelessWidget {
  final String str;
  final TextStyle style;
  final AnimConfig config;

  FlutterText(this.str, {Key key, this.style, this.config}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Wrap(
        children: str.split("").map((e) =>
        FlutterContainer(
          config: config,
          child: Text(
            e,
            style: style,
          ),
        )).toList(),
      );
}
