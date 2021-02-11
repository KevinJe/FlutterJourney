/// Dart 中通过 class 声明一个类，继承使用 extends
///
class Person {
  // 构造函数
  Person(String name, int age);
  String name;
  int age;
}

class Child extends Person {
  // 使用 : super(name, age) 调用父类的构造函数
  Child(String name, int age) : super(name, age);

  // 命名构造 使用 Child.方法名来构造对象
  Child.height(int height) : super("", height);
}

// 声明抽象类
abstract class Fruit {
  // 使用this.属性 对属性继续初始化
  Fruit(this._name);

  // 变量名称前面加下划线说明是私有属性，其它文件无法直接访问
  final String _name;
}

main() {

}