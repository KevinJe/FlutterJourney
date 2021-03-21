import 'package:flutter/material.dart';
import 'circle_image.dart';

class NinePointBox extends StatelessWidget {
  NinePointBox(
      {Key key,
      @required this.image,
      this.child,
      @required this.sliceRect,
      this.padding})
      : super(key: key);

  final ImageProvider image;
  final Widget child;
  final Rect sliceRect;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        centerSlice: this.sliceRect,
        image: image,
      )),
      padding: padding,
      child: child,
    );
  }
}

// 组件的类型
enum ChartType { right, left }

// 组件信息描述
class ChatItem {
  // 头像
  ImageProvider headIcon;

  // 最大宽
  double maxWidth;

  // 组件类型
  ChartType type;

  // 文字信息
  String text;

  ChatItem({this.headIcon, this.text, this.type = ChartType.right});
}

class ChatWidget extends StatelessWidget {
  ChatWidget({Key key, this.chatItem}) : super(key: key);

  final ChatItem chatItem;

  @override
  Widget build(BuildContext context) {
    bool isRight = chatItem.type == ChartType.right; // 是否在右侧
    // 头像
    var head = Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: CircleImage(
        image: chatItem.headIcon,
      ),
    );

    // 绿色对话框
    var rightBox = NinePointBox(
      image: AssetImage('assets/images/right_chat.png'),
      sliceRect: Rect.fromLTRB(6, 28, 60, 29),
      padding: EdgeInsets.fromLTRB(15, 10, 20, 10.0),
      child: Text(
        chatItem.text,
        style: TextStyle(fontSize: 15.0),
      ),
    );

    //白色对话框
    var leftBox = NinePointBox(
      sliceRect: Rect.fromLTRB(14, 27, 69, 28),
      padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
      image: AssetImage(
        'assets/images/left_chat.png',
      ),
      child: Text(
        chatItem.text,
        style: TextStyle(fontSize: 15.0),
      ),
    );

    return Container(
      // 根据左右来构建组件
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        mainAxisAlignment:
            isRight ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (isRight) Flexible(child: rightBox),
          head,
          if (!isRight) Flexible(child: leftBox)
        ],
      ),
    );
  }
}
