import 'package:flutter/material.dart';

class GoodsDetailPager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品详情页'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: ElevatedButton(
        onPressed: () => _toHome(context),
        child: Text('返回主页'),
      ),
    );
  }

  // 跳转到主页
  void _toHome(BuildContext context) {
    // 返回上一页只需要调用Navigator的pop方法将栈顶弹出
    Navigator.pop(context);
  }
}
