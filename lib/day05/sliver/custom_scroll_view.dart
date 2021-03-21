import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_journey/day03/views/home/home_menu.dart';
import 'package:flutter_journey/day05/pome_item/03/poem_item_widget.dart';
import 'package:flutter_journey/utils/color_utils.dart';

class CustomScrollViewTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bar = SliverAppBar(
      // 是否固定在顶部
      pinned: true,
      // 滑动时展开或收缩内容
      snap: false,
      // 浮动，false时，snap属性也必须位false，此时只有列表滚动到头部，布局才伸展，true时只要有上滑的动作布局就会伸展
      floating: false,
      // 是否预留高度
      primary: true,
      elevation: 10,
      // 阴影
      leading: Icon(Icons.language),
      expandedHeight: 190.0,
      // 展开高度
      actions: [HomeMenu()],
      // 右侧菜单
      flexibleSpace: FlexibleSpaceBar(
        // 伸展处布局
        titlePadding: EdgeInsets.only(left: 45, bottom: 12), // 标题边距
        collapseMode: CollapseMode.parallax, // 视差效果
        title: const Text(
          '世界设计师',
          style: TextStyle(color: Colors.black, shadows: [
            Shadow(color: Colors.blue, offset: Offset(1, 1), blurRadius: 2)
          ]),
        ),
        background: Image.asset(
          "assets/images/caver.jpeg",
          fit: BoxFit.cover,
        ),
      ),
    );

    var caverTextStyle = TextStyle(
        fontSize: 18,
        shadows: [Shadow(color: Colors.white, offset: Offset(1, 1))]);

    var header = SliverPersistentHeader( // 吸顶效果的头部
        pinned: true,
        delegate: _SliverAppBarDelegate(
            minHeight: 40.0,
            maxHeight: 100.0,
            child: Container(
              color: Color(0xFFCCA4FF),
              child: Center(
                child: Text(
                  "袅缈岁月，青丝银发",
                  style: caverTextStyle,
                ),
              ),
            )));

    var header2 = SliverPersistentHeader( // 吸顶效果的头部
      floating: false, // floating 与 pinned 不能同时设置为true
      pinned: true,
      delegate: _SliverAppBarDelegate(
          minHeight: 40.0,
          maxHeight: 100.0,
          child: Container(
            color: Color(0xFFE7FCC9),
            child: Center(
              child: Text(
                '以梦为马，不负韶华',
                style: caverTextStyle,
              ),
            ),
          )),
    );

    var fixExtentList = SliverFixedExtentList(
      // 构建的是一个固定条目高度为itemExtent的列表
      itemExtent: 60,
      delegate: SliverChildBuilderDelegate(
          (_, int index) => Card(
                margin: EdgeInsets.all(2),
                child: Container(
                  alignment: Alignment.center,
                  color: ColorUtils.randomColor(),
                  child: Text("list $index"),
                ),
              ),
          childCount: 50 // 50个item
          ),
    );

    var fillViewport = SliverFillViewport(
      // 创建的item条目大小会填充屏幕视图
      delegate: SliverChildBuilderDelegate(
          // 适用于不固定数量的item的List
          (_, int index) => Card(
                margin: EdgeInsets.all(2),
                child: Container(
                  alignment: Alignment.center,
                  color: ColorUtils.randomColor(),
                  child: Text("viewport $index"),
                ),
              ),
          childCount: 50),
    );

    var sliverList = SliverList(
      // 创建的item条目只是包裹内容的
      // delegate: SliverChildListDelegate(<Widget>[ // SliverChildListDelegate 适用于有固定数量的item的List
      //   Text(
      //     "SliverList SliverChildListDelegate",
      //     style: TextStyle(fontSize: 12, decoration: TextDecoration.none),
      //   ),
      // ]),

      delegate: SliverChildBuilderDelegate(
          // 适用于不固定数量的item的List
          (_, int index) => Card(
                margin: EdgeInsets.all(2),
                child: Container(
                  alignment: Alignment.center,
                  color: ColorUtils.randomColor(),
                  child: Text("viewport $index"),
                ),
              ),
          childCount: 50),
    );

    var sliverGridCount = SliverGrid.count(
      // 固定数量
      crossAxisCount: 4,
      childAspectRatio: 1.3,
      children: List.generate(8, (index) => index)
          .map((e) => Card(
                child: Container(
                  alignment: Alignment.center,
                  color: ColorUtils.randomColor(),
                  child: Text("$e"),
                ),
              ))
          .toList(),
    );

    var sliverGridExtent = SliverGrid.extent(
      // 条目按比例填充
      maxCrossAxisExtent: 80,
      childAspectRatio: 1.3,
      children: List.generate(10, (index) => index)
          .map((e) => Card(
                child: Container(
                  alignment: Alignment.center,
                  color: ColorUtils.randomColor(),
                  child: Text("$e"),
                ),
              ))
          .toList(),
    );

    var adapter = SliverToBoxAdapter(
      child: PoemItemWidget(
        data: PoemItem(
            isCard: false,
            image: AssetImage("assets/images/wy_200x300.jpg"),
            title: "以梦为马",
            author: "海子",
            summary: "我要做远方的忠诚的儿子，和物质的短暂情人，和所有以梦为马的诗人一样，我不得不和烈士和小丑走在同一道路上"),
      ),
    );

    return Scaffold(
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          bar, header, sliverGridExtent, adapter, header2, sliverGridCount, fixExtentList
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(
      {@required this.minHeight,
      @required this.maxHeight,
      @required this.child});

  final double minHeight; // 最小高度
  final double maxHeight; // 最大高度
  final Widget child; // 孩子

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  double get minExtent => minHeight;

  // 是否需要重建
  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxExtent ||
        minHeight != oldDelegate.minExtent ||
        child != oldDelegate.child;
  }

}
