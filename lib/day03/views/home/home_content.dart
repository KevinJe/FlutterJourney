import 'package:flutter/material.dart';
import 'package:flutter_journey/day03/views/draws/clock_page/clock_page.dart';
import 'package:flutter_journey/day03/views/draws/grid_page.dart';
import 'package:flutter_journey/day03/views/draws/star_page.dart';
import 'package:flutter_journey/day03/views/draws/canvas_page.dart';
import 'package:flutter_journey/day03/views/draws/clock_page/clock_page.dart';
import '../../app/cons.dart';

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: Cons.homeTabs.length,
      vsync: ScrollableState(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBar'),
        bottom: TabBar(
          tabs: Cons.homeTabs.map((f) {
            return Text(f);
          }).toList(),
          controller: _controller,
          indicatorColor: Colors.red,
          indicatorSize: TabBarIndicatorSize.tab,
          isScrollable: true,
          labelColor: Colors.red,
          unselectedLabelColor: Colors.black,
          indicatorWeight: 5.0,
          labelStyle: TextStyle(height: 2),
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: Cons.homeTabs.map((text) {
          return Container(
            child: _buildContent(Cons.homeTabs.indexOf(text)),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildContent(int index) {
    print('index is $index');
    switch (index) {
      case 0:
        return GridPager();
        break;
      case 1:
        return StarPage();
        break;
      case 2:
        return ClockPage();
        break;
      case 3:
        return CanvasPage();
        break;
    }
  }
}
