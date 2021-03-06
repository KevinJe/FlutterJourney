import 'package:flutter/material.dart';
import 'package:flutter_journey/day05/chart_widget/chart_widget.dart';
import 'chat_api.dart';
import 'load_more_widget.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatItem> _data; // 数据
  final ChatApi api = ChatApi.monk(50);

  ScrollController _scrollController = ScrollController(); // 定义变量及初始化

  @override
  void initState() {
    _data = api.chatItem; // 初始化数据
    _scrollController.addListener(() {
      // 添加监听
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMore();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose(); // 释放控制器
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var content = ListView.builder(
        controller: _scrollController,
        itemCount: _data.length + 1, // 条目个数
        itemBuilder: (BuildContext context, int index) => index == _data.length
            ? LoadMoreWidget()
            : ChatWidget(
                chatItem: _data[index],
              ));
    return RefreshIndicator(child: content, onRefresh: _render);
  }

  // 异步请求 + 更新界面
  Future<void> _render() async {
    await api.addTop();
    setState(() {
      _data = api.chatItem;
    });
  }

  // 加载逻辑
  _loadMore() async {
    await api.addBottom();
    setState(() {
      _data = api.chatItem;
    });
  }
}
