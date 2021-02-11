import 'dart:io';

main() {
  // Water(0).heat().then((water) => {
  //   print('水已经烧开了，现在温度：${water.temperature}, 开始冲水！')
  // });

  heat();
  print('扫地');
}

class Water {
  double temperature;
  Water(this.temperature);

  Future<Water> heat() {
    print('打开烧水开关');
    return Future<Water> (() {
      sleep(Duration(seconds: 3)); // 模拟烧水过程
      temperature = 100;
      return this;
    });
  }
}

/// 使用 async  和 await 实现异步
/// async 加在方法上表示异步
/// await 关键字标识在Future对象前，就可以获得未来的对象
Future<Water> heat() async {
  var water = await Water(0).heat();
  print('水已经烧开了，现在温度：${water.temperature}, 开始冲水！');
  return water;
}