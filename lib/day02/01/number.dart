// Dart中数字类型，有num、int、double，并且都是类，也就是对象级别，默认值为null
// Dart中没有float、long等类型
main() {
  num age = 18; // num数据类型
  int height = 180; // int 整形
  double weight = 62.5; // double 浮点型
  print(height / weight is double); // true
  print(height * age is double); // false
  print(age / height is double); // true
}