import 'package:flutter/material.dart';
import 'package:flutter_journey/day03/app/cons.dart';
import 'package:flutter_journey/day03/views/home/home_button.dart';
import 'package:flutter_journey/day03/views/home/home_content.dart';
import '../../views/home/home_menu.dart';
import '../home/home_left_drawer.dart';
import '../home/home_right_drawer.dart';
import '../draws/grid_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // 标签控制器
      length: Cons.homeTabs.length, // 标签个数
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Flutter 联盟'),
          actions: <Widget>[Icon(Icons.search), HomeMenu()], // 标题栏右侧按钮
          bottom: _buildHomeTabBar(),
        ),
        body: Align(
          alignment: Alignment(0, -0.8),
          child: Text("展示集"),
        ),
        drawer: HomeLeftDrawer(),
        // 左侧滑页
        endDrawer: HomeRightDrawer(),
        // 右侧滑页
        floatingActionButton: HomeButton(),
      ),
    );
  }

  // 构建标签栏
  PreferredSizeWidget _buildHomeTabBar() => TabBar(
      labelStyle: TextStyle(fontSize: 14), // 字号
      labelColor: Color(0xFFFFFFFF), // 选中文字颜色
      unselectedLabelColor: Color(0xFFEEEEEE), // 未选中文字颜色
      tabs: Cons.homeTabs
          .map((tab) => Container(
                height: 40,
                alignment: Alignment.center,
                child: Text(tab),
              ))
          .toList());

  //创建主页界面列表
  Widget _homeContent() => TabBarView(
      //根据列表创建界面列表
      children: Cons.homeTabs
          .map((text) => _buildContent(Cons.homeTabs.indexOf(text)))
          .toList());

  Widget _buildContent(int index) {
    switch (index) {
      case 0:
        return GridPager();
    }
  }
}
