import 'package:flutter/material.dart';
import 'circle_image.dart';

/// 信息描述类
class PoemItem {
  ImageProvider image; // 图片
  var title; // 标题
  var author; // 作者
  var summary; // 摘要
  bool isCard; // 是否卡片化
  PoemItem(
      {this.image, this.title, this.author, this.summary, this.isCard = true});
}

class PoemItemWidget extends StatelessWidget {
  PoemItemWidget({Key key, this.data}) : super(key: key);

  final PoemItem data;

  @override
  Widget build(BuildContext context) {
    // 头像
    var headIcon = Padding(
      padding: EdgeInsets.all(5),
      child: CircleImage(image: data.image),
    );
    // 中间部分
    var center = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          data.title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: Text(
            "作者：${data.author}",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        )
      ],
    );

    // 尾部
    var summary = Text(
      data.summary,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(color: Colors.grey, fontSize: 12),
    );

    // 拼合在一起
    var item = Row(
      children: <Widget>[
        SizedBox(
          width: 10,
        ),
        headIcon,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: center,
        ),
        Expanded(child: summary),
        SizedBox(
          width: 10,
        )
      ],
    );

    var card = Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(5),
        child: item,
      ),
    );
    // 判断是不是card格式
    return data.isCard ? card : item;
  }
}
