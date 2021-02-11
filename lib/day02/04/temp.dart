main() {
  int _counter = 0;
  print("count is $_counter"); // 字符串内嵌表达式 $

  var a = 20;
  var b;
  var c = b ?? ++a; // 当表达式左侧为空才会执行右侧，否则就执行左侧 ??
  print(c);

  var d = 5;
  d = null;
  print(d?.abs()); // null , ?. 当调用对象为空时返回 null ，不再调用右侧

  // var paint = Paint();
  // paint.strokeCap = StrokeCap.round;
  // paint.style = PaintingStyle.fill;
  // paint.color = Colors.red;
  // paint.isAntiAlias = true;
  // paint.filterQuality = FilterQuality.high;

  // paint //  .. 级联操作符 ，返回当前对象，可以实现链式调用
  //   ..strokeCap = StrokeCap.round
  //   ..style = PaintingStyle.fill
  //   ..color = Colors.red
  //   ..isAntiAlias = true
  //   ..filterQuality = FilterQuality.high;

  var lang = <String>["Java", "Kotlin"];
  print(["Dart", "Python", ... lang]); // ... 解构，将一个列表解构成一个个元素，可以直接将元素添加到列表中  [Dart, Python, Java, Kotlin]

  print(a is int); // is 判断一个对象是否时某个类型
  print(a is! int); // is! 与 is相反
  print(a as String); // as 进行类型转换

  List<String> languageList = ['Java', 'Dart', 'Kotlin']; // 使用<>声明泛型
  Map<String, int> markMap = {'Java': 100, 'Dart': 80};
  Set<String> languageSet = {'Java', 'Dart', 'Kotlin'};

  var languageList1 = <String>['Java', 'Dart', 'Kotlin']; // 由于var关键字声明变量时无法指定泛型，可以使用右侧的形式展开
  var markMap1 = <String, int>{'Java': 100, 'Dart': 80};
  var languageSet1 = <String>{'Java', 'Dart', 'Kotlin'};
 }
