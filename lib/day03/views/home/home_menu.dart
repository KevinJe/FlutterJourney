import 'package:flutter/material.dart';
import 'package:flutter_journey/day03/dialogs/dialog_about.dart';
import '../../app/cons.dart';

class HomeMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      //创建按钮菜单
      itemBuilder: _buildMenuItem,
      onSelected: (index) => _onSelected(context, index),
    );
  }

  List<PopupMenuEntry<int>> _buildMenuItem(context) => Cons.menuInfo
      .map((e) => PopupMenuItem(value: Cons.menuInfo.indexOf(e), child: Text(e)))
      .toList();

  void _onSelected(BuildContext context, int index) {
    print(index);
    switch (index) {
      case 0:
        showDialog(context: context, builder: (context) => DialogAbout());
        break;
    }
  }
}
