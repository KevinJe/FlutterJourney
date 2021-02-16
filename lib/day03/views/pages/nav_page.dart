import 'package:flutter/material.dart';
import 'package:flutter_journey/day03/views/home/home_content.dart';
import '../pages/act_page.dart';
import '../pages/love_page.dart';
import '../pages/note_page.dart';
import '../pages/me_page.dart';
import '../../app/cons.dart';
import 'home_page.dart';
import '../../views/home/TabBarDemo.dart';

class NavPage extends StatefulWidget {
  @override
  _NavPageState createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  var _position = 0; // 当前激活页
  final _ctrl = PageController(); // 页面控制器

  @override
  void dispose() {
    _ctrl.dispose(); // 释放控制器
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        // 使用PageView实现五个页面切换
        controller: _ctrl,
        children: _buildContent(),
        onPageChanged: _onTapBottomItem,
      ),
      bottomNavigationBar: BottomNavigationBar(
        // 底部栏
        items: _buildBottomItems(), // 背景色
        currentIndex: _position, // 激活位置
        onTap: _onTapBottomItem,
      ),
    );
  }

  // 主体内容页面列表
  List<Widget> _buildContent() => <Widget>[
        // HomePage(),
        HomeContent(),
        // TabBarDemo(),
        ActPage(),
        LovePage(),
        NotePage(),
        MePage(),
      ];

  // 通过控制器切换PageView页面，并更新索引
  void _onTapBottomItem(position) {
    print('position is $position');
    _ctrl.jumpToPage(position);
    setState(() {
      _position = position;
    });
  }

  // 生成底部导航栏item
  List<BottomNavigationBarItem> _buildBottomItems() => Cons.bottomNavMap.keys
      .map((e) => BottomNavigationBarItem(
            label: e,
            icon: Icon(Cons.bottomNavMap[e]),
            backgroundColor: Colors.blue,
          ))
      .toList();
}
