main() {
  var age = 18; // int
  var isMan = true; // bool
  var name = 'Kevin'; // String
  var languages = ['Java', 'Dart', 'Python', 'C++', 'Kotlin']; // 数组
  var languages2 = {'Java', 'Dart', 'Python', 'C++', 'Kotlin', 'Java'}; // 集合 Set
  var map = {1: 'one', 2: 'two', 3: 'three'}; // Map
  var className = #Person;
  var who; // var声明的变量，未赋值，那么该变量的数据类型可以修改，此时其类型是dynamic的
  who = 'what';
  print(who is String); // true
  who = 10;
  print(who is int); // true
  var who1 = 'what'; // 如果使用var声明变量的时候赋值了，那么它的类型就固定了，不可修改
  // who1 = 10; // A value of type 'int' can't be assigned to a variable of type 'String'.

  final PI = 3.1415926; // final 定义常量，final定义的是运行时常量，在运行期间才能获取到的常量必须用final定义
  // PI = 4; // The final variable 'PI' can only be set once.
  const Pi = 3.14159265; // const 定义常量，const定义的是编译器常量
  // Pi = 4; // Constant variables can't be assigned a value.

  final f = DateTime.now(); // OK
  // const c = DateTime.now(); // Error Const variables must be initialized with a constant value.

}