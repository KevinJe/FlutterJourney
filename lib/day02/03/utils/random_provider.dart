import 'dart:math';

class RandomProvider {
  RandomProvider._(); // 构造函数私有化
  static final _random = Random();
  static get random => _random; // getter
}