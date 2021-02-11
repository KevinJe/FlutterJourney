import 'dart:math';
import 'package:flutter/material.dart';


main() {
  // Dart 是完全面向对象的语言，函数本身也是对象，通过runtimeType获取
  // ({int limitA, int limitR, int limitG, int limitB}) => Color
  print(randomColor.runtimeType);
  // 使用函数类型作为变量  25
  print(add(3, 4, op: square));
}

/// 返回随机色
/// Dart中函数没有关键字，以()结尾即可，前面加返回值类型
// Color randomColor() {
//   var random = Random();
//   var a = random.nextInt(256); // 透明度
//   var r = random.nextInt(256); // 红
//   var g = random.nextInt(256); // 绿
//   var b = random.nextInt(256); // 蓝
//   return Color.fromARGB(a, r, g, b); // 生成argb模式的颜色
// }

/// 函数的普通参数
// Color randomColor(int limitA) {
//   var random  = Random();
//   var a = limitA + random.nextInt(256 - limitA); // 透明度
//   var r = random.nextInt(256); // 红
//   var g = random.nextInt(256); // 绿
//   var b = random.nextInt(256); // 蓝
//   return Color.fromARGB(a, r, g, b); // 生成argb模式颜色
// }

/// [] 声明可选参数，使用时入参必须按照顺序来排列
// Color randomColor([int limitA = 120, limitB = 100]) {
//   var random = Random();
//   var a = limitA + random.nextInt(256 - limitA); // 透明度
//   var r = random.nextInt(256); // red
//   var g = random.nextInt(256); // green
//   var b = limitB + random.nextInt(256 - limitB); // blue
//   return Color.fromARGB(a, r, g, b);
// }

/// 使用 {} 键值参数，可以指定若干个参数，使用键名进行传参
/// randomColor(limitA: 100, limitB: 40 )
Color randomColor({int limitA = 120, int limitR = 0, int limitG = 0, int limitB = 0,}) {
  var random = Random();
  var a = limitA + random.nextInt(256 - limitA); // 透明度
  var r = limitR + random.nextInt(256 - limitR); // red
  var g = limitG + random.nextInt(256 - limitG); // green
  var b = limitB + random.nextInt(256 - limitB); // blue
  return Color.fromARGB(a, r, g, b);
}

/// 函数是一种类型，就可以作为变量，使用add时先对两个数进行操作后再相加
num add(num a, num b, {Function op}) {
  return op(a) + op(b);
}

/// 语法糖写法，简化
addSimple(a, b, {op}) {
  return op(a) + op(b);
}

/// 函数体只有一行时使用 =>
num add1(num a, num b, {Function op}) => op(a) + op(b);

/// 定义一个函数变量
Function square = (a) {
  return a * a;
};






