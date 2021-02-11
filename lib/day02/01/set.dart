main() {
  // Set 集合中不能添加相同元素
  Set<String> languages = {'Java', 'Dart', 'Python', 'C++', 'Kotlin', 'Java'};
  print(languages); // {Java, Dart, Python, C++, Kotlin}
  print(languages.add('Java')); // false 添加失败
  print(languages.add('JavaScript')); // true 添加成功
  print(languages.contains('Dart')); // true 包含
  languages.remove('JavaScript'); // true 移除元素
  print(languages.toList()); // 变为一个列表 [Java, Dart, Python, C++, Kotlin]
  languages.forEach((e) { print(e); }); // 遍历元素
  print({1, 2, 3, 4}.difference({2, 3, 6})); // {1, 4} 不同的地方
  print({1, 2, 3, 4}.union({2, 3, 6})); // {1, 2, 3, 4, 6} 并集
  print({1, 2, 3, 4}.intersection({2, 3, 6})); // {2, 3} 交集
}