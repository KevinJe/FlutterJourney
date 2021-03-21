import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_journey/day05/chart_widget/chart_widget.dart';

class ChatApi {
  var random = Random(); // 随机数
  List<ChatItem> _chatItem = <ChatItem>[];

  List<ChatItem> get chatItem => _chatItem;

  ChatApi addMonk(int count) {
    var strs = [
      "我是要成为编程之王的男人，"
          "你是要成为编程之王的女人；",
      "凭君莫话封侯事，一将功成万骨枯。你觉得如何?",
      "识君，吾之幸也;失君，吾之憾也;守君，吾之愿也。",
      "简单必有简单的成本，复杂必有复杂的价值。"
    ];
    for (var i = 0; i < count; i++) {
      _chatItem.add(ChatItem(
          headIcon: AssetImage(i.isEven
              ? "assets/images/wy_200x300.jpg"
              : "assets/images/icon_head.png"),
          text: strs[random.nextInt(strs.length)],
          type: i.isEven ? ChartType.left : ChartType.right));
    }
    return this;
  }
}
