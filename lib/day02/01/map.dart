main() {
  baseUse();
}

baseUse() {
  Map<String, num> dict = {"a": 1, "b": 30, "c": 70, "price": 40.0}; // 创建一个map
  print(dict); // {a: 1, b: 30, c: 70, price: 40.0}
  print(dict['price']); // 40.0 访问map中元素
  dict["a"] = 2; // 修改map中key对应的value
  print(dict); // {a: 2, b: 30, c: 70, price: 40.0}
  print(dict.containsKey('price')); // true 包含
  print(dict.containsValue('price')); // false 不包含
  print(dict.isEmpty); // false 不为空
  print(dict.isNotEmpty); // true 不为空
  print(dict.length); // 4 长度
  dict.remove('c'); // 移除key对应的值
  print(dict); // {a: 2, b: 30, price: 40.0}
  print(dict.keys.toList()); // [a, b, price] key组成的数组
  print(dict.values.toList()); // [2, 30, 40.0] value 组成的数组

  List<int> numLi = [1, 2, 3, 4, 5];
  List<String> numEN = ["one","two","three","four","five"];
  List<String> numCN = ["壹","贰","叁","肆","伍"];
  Map<int, String> mapEN = Map.fromIterables(numLi, numEN);
  Map<int, String> mapCN = Map.fromIterables(numLi, numCN);
  print(mapCN); // {1: 壹, 2: 贰, 3: 叁, 4: 肆, 5: 伍}
  print(mapEN); // {1: one, 2: two, 3: three, 4: four, 5: five}
  print(Map.fromIterables(mapEN.values, mapCN.values)); // {one: 壹, two: 贰, three: 叁, four: 肆, five: 伍}
}