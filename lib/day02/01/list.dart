main() {
  test();
  // baseUse();
}

baseUse() {
  List<String> languages = ['Java', 'Dart', 'Python', 'C++', 'Kotlin'];
  print(languages[0]); // Java访问索引为0的元素
  languages.add('JavaScript'); // 添加元素
  print(languages.length); // 6 数组长度
  languages.removeAt(1); // 移除索引处的元素
  languages.insert(3, 'PHP'); // 插入元素
  print(languages); // [Java, Python, C++, PHP, Kotlin, JavaScript]
  print(languages.getRange(3, 5)); // (PHP, Kotlin) 获取指定范围的元素
  print(languages.sublist(2, 4)); // [C++, PHP]  截取子列表
  print(languages.join("!")); // 每个元素后加上分隔符 Java!Python!C++!PHP!Kotlin!JavaScript
  print(languages.isEmpty); // false 列表是否为空
  print(languages.contains('Ruby')); // false 是否包含某个元素
  languages.clear(); // 清空列表
}

test() {
  // 元素类型转换，通过map函数遍历列表并生成新元素列表
  List<String> strNum = ['11', '23', '34', '24', '65'];
  var intNum = strNum.map((String str) => int.parse(str)).toList();
  print(intNum); // [11, 23, 34, 24, 65]

  // 条件遍历过滤列表，通过map函数遍历列表生成新元素列表
  var bigThan30 = intNum.where((int num) => num > 30).toList();
  print(bigThan30); // [34, 65]

  // 列表解构
  var parser = [0, 100, ... intNum, 30];
  print(parser); // [0, 100, 11, 23, 34, 24, 65, 30]

  // 构造列表是可以使用if表达式
  bool flag = bigThan30.length >= 3;
  var chooseLi = [if (!flag) 666, ... parser, if (flag) 555 else 55];
  print(chooseLi); // [666, 0, 100, 11, 23, 34, 24, 65, 30, 55]

}