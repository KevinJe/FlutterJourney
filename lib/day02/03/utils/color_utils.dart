import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_journey/day02/03/utils/random_provider.dart';

class ColorUtils {
  static Color randomColor({int limitA = 120, int limitR = 0, int limitG = 0, int limitB = 0}) {
    var random = RandomProvider.random;
    var a = limitA + random.nextInt(256 - limitA); // alpha
    var r = limitR + random.nrextInt(256 - limitR); // red
    var g = limitG + random.nextInt(256 - limitG); // green
    var b = limitB + random.nextInt(256 - limitB); // blue
    return Color.fromARGB(a, r, g, b);
  }

  /// 使用方法:
  /// var color1=ColorUtils.parse("#33428A43");
  /// var color2=ColorUtils.parse("33428A43");
  /// var color3=ColorUtils.parse("#428A43");
  ///var color4=ColorUtils.parse("428A43");
  static Color parse(String colorStr) {
    Color result = Colors.red;
    var value = 0;
    if (colorStr.contains("#")) {
      try {
        value = int.parse(colorStr.substring(1), radix: 16);
      } catch (e) {
        print(e);
      }
    }
    switch (colorStr.length) {
      case 1 + 6: // 6 位
        result = Color(value + 0xFF000000);
        break;
      case 1 + 8: // 8 未
        result = Color(value);
        break;
      default:
        result = Colors.red;
    }
    return result;
  }
}
